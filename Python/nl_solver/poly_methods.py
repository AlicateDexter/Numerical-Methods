# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 20:51:19 2022

@author: heito
"""

import numpy as np
from .bases import PolyScalarMethod, PolyMultiMethod

class Muller(PolyScalarMethod):
    
    def __call__(self, x0):
        
        poly = self.fun
        n_iter = self.n_iter
        fun_stop = self.fun_stop
        etol = self.etol
        
        x0 = np.array(x0)
        f0, f1, f2 = poly(x0)
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            x_old = x0[2]
            h0 = x0[1] - x0[0]
            h1 = x0[2] - x0[1]
            
            d0 = (f1 - f0) / h0
            d1 = (f2 - f1) / h1
            
            a = (d1 - d0)/(h1 + h0)
            b = a * h1 + d1
            c = f2
            
            delta = (b**2 - 4*a*c) ** 0.5
            
            div_l = b - delta
            div_u = b + delta
            
            if abs(div_u) > abs(div_l):
                div = div_u
            else:
                div = div_l
            
            x0[2] = x0[2] - (2 * c) / div
            f0, f1, f2 = poly(x0)
            
            
            if (res:= fun_stop(x0[2], x_old, f2)) < etol:
                res_app(res)
                break
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x0[2]
        self.residuals = residuals
    
class DurandKernerSeidel(PolyMultiMethod):
    
    def __call__(self, x0):
        
        poly = self.fun
        n_iter = self.n_iter
        fun_stop = self.fun_stop
        etol = self.etol
        n = poly.coefs.size - 1
        
        
        residuals = []
        res_app = residuals.append
        
        if (x0 := np.array(x0)) is None:
            x0 = (0.4 + 0.9 * 1j) ** np.linspace(0, n-1, n)
        
        for i in range(n_iter):
            
            x_old = x0.copy()
            
            for j in range(n):
                x_aux = x0[j]
                m = x_aux - np.delete(x0, j)
                p = m.prod()
                x0[j] -= poly(x_aux)/p
            
            if (res := fun_stop(x0, x_old, poly(x0))) < etol:
                res_app(res)
                break
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x0
        self.residuals = residuals
    
class DurandKernerJacobi(PolyMultiMethod):
    
    def __call__(self, x0):
        
        poly = self.fun
        n_iter = self.n_iter
        fun_stop = self.fun_stop
        etol = self.etol
        n = poly.coefs.size - 1
        
        residuals = []
        res_app = residuals.append
        
        if (x0 := np.array(x0)) is None:
            x0 = (0.4 + 0.9 * 1j) ** np.linspace(0, n-1, n)
        
        for i in range(n_iter):
            
            x_old = x0.copy()
            
            M = x0 - x0.reshape(-1, 1) + np.eye(n)
            p = M.prod(axis = 1)
            x0 -= poly(x0)/p
            
            if (res := fun_stop(x0, x_old, poly(x0))) < etol:
                res_app(res)
                break
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x0
        self.residuals = residuals