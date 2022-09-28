# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 16:57:49 2022

@author: heito
"""

import numpy as np

EPS = 1e-15

class IntervalError(Exception):
    pass


class Polynomial:
    def __init__(self, coefs):
        self.coefs = np.array(coefs)
        
    def __call__(self, x):
        p = 0
        for c in self.coefs[::-1]:
            p = p*x + c
            
        return p
    
    def derivative(self):
        
        coefs = self.coefs
        dcoefs = coefs * np.linspace(0, coefs.size-1, coefs.size)
        
        return Polynomial(dcoefs[1:])
    
    def anti_derivative(self, C = 0):
        
        coefs = self.coefs
        icoefs = [C]
        aux = coefs / np.linspace(1, coefs.size, coefs.size)
        
        return Polynomial(np.append(icoefs, aux))
    
    def deflation(self, r):
        
        coefs = self.coefs
        
        c = coefs[::-1]
        nc = np.zeros(c.size - 1)
        
        nc[0] = c[0]
        
        for i in range(1, coefs.size - 1):
            nc[i] = c[i] + nc[i-1] * r
            
        return Polynomial(nc[::-1])