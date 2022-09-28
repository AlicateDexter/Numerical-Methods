# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 20:55:06 2022

@author: heito
"""

from .bases import OpenScalarMethod
from .utils import EPS

class NewtonRaphson(OpenScalarMethod):
    
    def __call__(self, x0):
            
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        h = self.h
        
        if (dfun := self.dfun) is None:
            dfun = lambda x: (fun(x + h) - fun(x - h)) / (2 * h)
        
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            f_new = fun(x0)
            df = dfun(x0)
        
            x_new = x0 - f_new / (df + EPS)
            
            if (res := fun_stop(x_new, x0, f_new)) < etol:
                res_app(res)
                break
            
            x0 = x_new
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals

class Halley(OpenScalarMethod):
    
    def __call__(self, x0):
        
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        h = self.h
        
        if (dfun := self.dfun) is None:
            dfun = lambda x: (fun(x + h) - fun(x - h)) / (2 * h)
        
        if (ddfun := self.ddfun) is None:
            ddfun = lambda x: (dfun(x + h) - dfun(x - h)) / (2 * h)
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            f_new = fun(x0)
            df = dfun(x0)
            ddf = ddfun(x0)
            
            x_new = x0 - (f_new * df) / (df ** 2 - (f_new * ddf))
            
            
            if (res := fun_stop(x_new, x0, f_new)) < etol:
                res_app(res)
                break
            
            x0 = x_new
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals
        
    
    
    
class FixedPoint(OpenScalarMethod):
    
    def __call__(self, x0):
        
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        
        g = lambda x: fun(x) + x
        
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            g_new = g(x0)
            
            x_new = g_new
            
            if (res := fun_stop(x_new, x0, g_new - x0)) < etol:
                res_app(res)
                break
            
            x0 = x_new
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals
    
    
class Secant(OpenScalarMethod):
    
    def __call__(self, x0):
        
        x1 = x0[1]
        x0 = x0[0]
        
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        
        f0 = fun(x0)
        f1 = fun(x1)
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            x_new = x1 - f1 * (x0 - x1) / (f0 - f1)
            
            if (res := fun_stop(x_new, x0, f1)) < etol:
                res_app(res)
                break
            
            f0 = f1
            x0 = x1
            x1 = x_new
            
            f1 = fun(x1)
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals
    