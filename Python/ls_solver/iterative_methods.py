# -*- coding: utf-8 -*-
"""
Created on Fri Sep 23 22:25:58 2022

@author: heito
"""

from .bases import IterativeSolverBase
import numpy as np


class GaussJacobi(IterativeSolverBase):
    
    def __call__(self, x0):
        
        A = self.A
        b = self.b
        
        n_iter = self.n_iter
        etol = self.etol
        fun_stop = self.fun_stop
        
        D = np.diag(A)
        A = A - np.diag(D)
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            x_new = (b - A.dot(x0)) / D
            
            if (res := fun_stop(x_new, x0)) < etol:
                res_app(res)
                break
            
            x0 = x_new.copy()
            
            res_app(res)
            
        self.status_flag(i)
        self.x = x_new
        self.residuals = residuals
        
        
class GaussSeidel(IterativeSolverBase):        
        
    def __call__(self, x0):
        
        x0 = np.array(x0, dtype=float)
        
        A = self.A
        b = self.b
        n = self.n
        
        n_iter = self.n_iter
        etol = self.etol
        fun_stop = self.fun_stop
        
        D = np.diag(A)
        A = A - np.diag(D)
        
        residuals = []
        res_app = residuals.append
        
        x_new = x0.copy()
        
        for i in range(n_iter):
            
            for j in range(n):
                
                x_new[j] = (b[j] - A[j, :].dot(x_new)) / D[j]
            
            if (res := fun_stop(x_new, x0)) < etol:
                
                res_app(res)
                break
            
            x0 = x_new.copy()
            
            res_app(res)
            
        self.status_flag(i)
        self.x = x_new
        self.residuals = residuals
