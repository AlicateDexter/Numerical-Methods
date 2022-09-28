# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 16:50:36 2022

@author: heito
"""

from .utils import Polynomial, IntervalError, EPS
import numpy as np



SCALAR_STOP = {
    'absolute_error': lambda x_new, x_old, f_new: abs(x_new - x_old),
    'relative_error': lambda x_new, x_old, f_new: abs((x_new-x_old)/(EPS + x_new)),
    'function_error': lambda x_new, x_old, f_new: abs(f_new)
    } 

MULTI_STOP = {
    'l2_absolute_error': lambda x_new, x_old, f_new: np.abs((x_new - x_old) @ (x_new - x_old)) ** 0.5,
    'l2_relative_error': lambda x_new, x_old, f_new: np.abs((x_new - x_old)/(EPS + x_new) @ (x_new - x_old)/(EPS + x_new)) ** 0.5,
    'l2_function_error': lambda x_new, x_old, f_new: np.abs(f_new @ f_new) ** 0.5,
    'li_absolute_error': lambda x_new, x_old, f_new: np.abs(x_new - x_old).max(),
    'li_relative_error': lambda x_new, x_old, f_new: np.abs((x_new-x_old)/(EPS + x_new)).max(),
    'li_function_error': lambda x_new, x_old, f_new: np.abs(f_new).max()
    }

class BaseScalarSolver:
    
    def __init__(self, fun, stop_criteria = 'absolute_error', etol = 1e-8,
                 n_iter = 50, message = True):
        
        self.fun = fun
        self.fun_stop = SCALAR_STOP[stop_criteria]
        self.etol = etol
        self.n_iter = n_iter
        self.message = message
        self.x_sol = None
        self.residuals = None
        
    def status_flag(self, i):
        
        if self.message:
            if i == self.n_iter - 1:
                print(f'Method fail to converge with {self.n_iter} iterations.')
            else:
                print(f'Method sucessed with {i+1} iterations.')
        
        
class BaseMultiSolver:
    
    def __init__(self, fun, stop_criteria = 'li_absolute_error', etol = 1e-8,
                 n_iter = 50, message = True):
        
        self.fun = fun
        self.fun_stop = MULTI_STOP[stop_criteria]
        self.etol = etol
        self.n_iter = n_iter
        self.message = message
        self.x_sol = None
        self.residuals = None
        
    def status_flag(self, i):
        
        if self.message:
            if i == self.n_iter - 1:
                print(f'Method fail to converge with {self.n_iter} iterations.')
            else:
                print(f'Method sucessed with {i+1} iterations.')
        


class BracketMethod(BaseScalarSolver):
    
    def __init__(self, fun, stop_criteria = 'absolute_error', etol = 1e-8,
                 n_iter = 50, message = True):
        
        super().__init__(fun, stop_criteria, etol, n_iter, message)
        
    def eval_bracket(self, bracket):
        
        fun = self.fun
        
        try:
        
            if fun(bracket[0]) * fun(bracket[1]) > 0:
                    raise IntervalError
        
        except IntervalError:
            print("Bolzano's Theorem not observed, converge not garanteed.")
        
        
class OpenScalarMethod(BaseScalarSolver):
    
    def __init__(self, fun, dfun = None, ddfun = None, h = 1e-8, 
                 stop_criteria = 'absolute_error', etol = 1e-8, n_iter = 50,
                 message = True): 
        
        super().__init__(fun, dfun, ddfun, h, stop_criteria, etol, n_iter, message)
        
        self.dfun = dfun
        self.ddfun = ddfun
        self.h = h

class OpenMultiMethod(BaseMultiSolver):
    
    def __init__(self, fun, dfun = None, ddfun = None, h = 1e-8, 
                 stop_criteria = 'li_absolute_error', etol = 1e-8, n_iter = 50,
                 message = True): 
        
        
        super().__init__(fun, stop_criteria, etol, n_iter, message)
        
        self.dfun = dfun
        self.ddfun = ddfun
        self.h = h
        
        
class PolyScalarMethod(BaseScalarSolver):
    
    def __init__(self, coefs, stop_criteria = 'absolute_error', etol = 1e-8,
                 n_iter = 50, message = True):
        fun = Polynomial(coefs)
        super().__init__(fun, stop_criteria, etol, n_iter, message)
        

class PolyMultiMethod(BaseMultiSolver):
    
    def __init__(self, coefs, stop_criteria = 'li_absolute_error', etol = 1e-8,
                 n_iter = 50, message = True):
        fun = Polynomial(coefs)
        super().__init__(fun, stop_criteria, etol, n_iter, message)
