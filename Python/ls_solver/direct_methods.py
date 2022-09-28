# -*- coding: utf-8 -*-
"""
Created on Fri Sep 23 22:00:15 2022

@author: heito
"""

from .bases import DirectSolverBase
import numpy as np

class GaussElimination(DirectSolverBase):
    
    def __init__(self, A, b):
        super().__init__(A)
        
        self.b = b
        self.solve()
    
    def decomposition(self):
        
        n = self.n
        M = self.M
        
        for i in range(n - 1):
            
            self.pivoting(M, i)
            
            factors = (M[i+1:, i] / M[i, i]).reshape(-1, 1)
            M[i+1:, i:] -= factors * M[i, i:]
            
        self.M = M
        
        
    def solve(self):
        
        self.M = np.hstack([self.A, self.b.reshape(-1, 1)])
        
        self.decomposition()
        self.regressive(self.M)


class LUSolver(DirectSolverBase):
    
    def __init__(self, A, b=None):
        super().__init__(A)
        
        self.U = np.zeros((self.n, self.n))
        self.L = np.eye(self.n)
        self.b = b
        
        if b is not None:
            self.solve(self.b)
    
    def decomposition(self):
        
        n = self.n
        A = self.A
        
        U = self.U
        L = self.L
        
        U[0, :] = A[0, :].copy()
        
        for i in range(n - 1):
            
            A = self.pivoting(A, i)
            factors = (A[i+1:, i] / A[i, i]).reshape(-1, 1)
            A[i+1:, i:] = A[i+1:, i:] - factors * A[i, i:]
            U[i+1:, i:] = A[i+1:, i:].copy()
            L[i+1:, i] = factors.flatten()
        
        self.U = U
        self.L = L
        
        
    def solve(self, b):
        
        b = b[self.pos]
        
        self.decomposition()
        
        self.progressive(np.hstack([self.L, b.reshape(-1, 1)]))
        self.regressive(np.hstack([self.U, self.x.reshape(-1, 1)]))