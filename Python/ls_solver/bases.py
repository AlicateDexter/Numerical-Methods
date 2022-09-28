# -*- coding: utf-8 -*-
"""
Created on Fri Sep 23 21:59:39 2022

@author: heito
"""

import numpy as np

EPS = 1e-15

MULTI_STOP = {
    'l2_absolute_error': lambda x_new, x_old: np.abs((x_new - x_old) @ (x_new - x_old)) ** 0.5,
    'l2_relative_error': lambda x_new, x_old: np.abs((x_new - x_old)/(EPS + x_new) @ (x_new - x_old)/(EPS + x_new)) ** 0.5,
    'li_absolute_error': lambda x_new, x_old: np.abs(x_new - x_old).max(),
    'li_relative_error': lambda x_new, x_old: np.abs((x_new-x_old)/(EPS + x_new)).max(),
    }

class DirectSolverBase:
    
    def __init__(self, A):
        self.A = np.array(A)
        self.n = A.shape[0]
        self.x = np.zeros(self.n)
        self.pos = list(range(self.n))
        
    def pivoting(self, M, i):
        
        pos = self.pos
        
        if (imax := np.abs(M[i:, i]).argmax() + i) != i:
            pos[i], pos[imax] = pos[imax], pos[i]
            M = M[pos]
            
        self.pos = pos
        
        return M
        
    def regressive(self, M):
        
        n = self.n
        x = self.x
        
        
        x[-1] = M[-1, -1] / M[-1, -2]
            
        for i in range(n-2, -1, -1):

            x[i] = (M[i, -1] - M[i, i+1:-1].dot(x[i+1:])) / M[i, i]
        
        self.x = x
    
    def progressive(self, M):
        
        n = self.n
        x = self.x
        
        x[0] = M[0, -1] / M[0, 0]
        
        for i in range(1, n, 1):
            x[i] = (M[i, -1] - M[i, 0:i].dot(x[0:i])) / M[i, i]
        
        self.x = x
        
        
class IterativeSolverBase:
    
    def __init__(self, A, b, stop_criteria = 'li_absolute_error', 
                 etol = 1e-8, n_iter = 50, message = True):
        self.A = A
        self.b = b
        self.n = A.shape[0]
        self.x = np.zeros(self.n)
        self.n_iter = n_iter
        self.etol = etol
        self.fun_stop = MULTI_STOP[stop_criteria]
        self.message = message
    
    def status_flag(self, i):
        
        if self.message:
            if i == self.n_iter - 1:
                print(f'Method fail to converge with {self.n_iter} iterations.')
            else:
                print(f'Method sucessed with {i+1} iterations.')