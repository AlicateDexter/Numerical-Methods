# -*- coding: utf-8 -*-
"""
Created on Fri Sep 23 21:00:05 2022

@author: heito
"""

from .bases import BracketMethod


class Bisection(BracketMethod):
    
    def __call__(self, x0):
        
        self.eval_bracket(x0)
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        
        xu = x0[0]
        xl = x0[1]
        
        fu = fun(xu)
        fl = fun(xl)
        
        x_old = xu
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            x_new = (xl + xu) * 0.5
            f_new = fun(x_new)
            
            if f_new * fl > 0:
                fl = f_new
                xl = x_new
            
            else:
                fu = f_new
                xu = x_new
                
            if (res := fun_stop(x_new, x_old, f_new)) < etol:
                res_app(res)
                break
            
            x_old = x_new
            
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals
        
class RegulaFalsi(BracketMethod):
    
    def __call__(self, x0):
        
        self.eval_bracket(x0)
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        
        xu = x0[0]
        xl = x0[1]
        
        fu = fun(xu)
        fl = fun(xl)
        
        x_old = xu
        
        residuals = []
        res_app = residuals.append
        
        for i in range(n_iter):
            
            x_new = (xu * fl - xl * fu)/(fl - fu)
            f_new = fun(x_new)
            
            if f_new * fl > 0:
                fl = f_new
                xl = x_new
            
            else:
                fu = f_new
                xu = x_new
                
            if (res := fun_stop(x_new, x_old, f_new)) < etol:
                res_app(res)
                break
            
            x_old = x_new
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals
        
class ModRegulaFalsi(BracketMethod):
    
    def __call__(self, x0):
        
        self.eval_bracket(x0)
        fun = self.fun
        fun_stop = self.fun_stop
        etol = self.etol
        n_iter = self.n_iter 
        
        xu = x0[0]
        xl = x0[1]
        
        fu = fun(xu)
        fl = fun(xl)
        
        x_old = xu
        
        residuals = []
        res_app = residuals.append
        l, u = 0, 0
        
        for i in range(n_iter):
            
            x_new = (xu * fl - xl * fu)/(fl - fu)
            f_new = fun(x_new)
            
            if f_new * fl > 0:
                fl = f_new
                xl = x_new
                u += 1
                l = 0
            
            else:
                fu = f_new
                xu = x_new
                l += 1
                u = 0
                
            if u == 2:
                fu *= 0.5
            
            if l == 2:
                fl *= 0.5
                
            if (res := fun_stop(x_new, x_old, f_new)) < etol:
                res_app(res)
                break
            
            x_old = x_new
            res_app(res)
            
        self.status_flag(i)
        self.x_sol = x_new
        self.residuals = residuals