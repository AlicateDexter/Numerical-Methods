# -*- coding: utf-8 -*-
"""
Created on Tue Jul 19 13:22:19 2022

@author: heito
"""

from .bracket_methods import Bisection, RegulaFalsi, ModRegulaFalsi
from .open_methods import NewtonRaphson, Halley, Secant, FixedPoint
from .poly_methods import Muller, DurandKernerJacobi, DurandKernerSeidel
import numpy as np


BRACKET_METHODS = {
    'Bisection': Bisection,
    'RegulaFalsi': RegulaFalsi,
    'ModRegulaFalsi': ModRegulaFalsi
    }

OPEN_METHODS = {
    'NewtonRaphson': NewtonRaphson,
    'Halley': Halley,
    'Secant': Secant,
    'FixedPoint': FixedPoint
    }

POLY_SCALAR_METHODS = {
    'Muller': Muller,
    }

POLY_MULTI_METHODS = {
    'DurandKernerJacobi':DurandKernerJacobi,
    'DurandKernerSeidel':DurandKernerSeidel
    }

def solve_scalar(fun, x0 = None, bracket = None, dfun = None, ddfun = None,
                 method = 'NewtonRaphson', h = 1e-8, 
                 stop_criteria = 'absolute_error', etol = 1e-8,
                 n_iter = 50, message = True, history = True):
    
    
    if method in BRACKET_METHODS:
        
        solver = BRACKET_METHODS[method]
        
        instance = solver(fun = fun, stop_criteria = stop_criteria, etol = etol,
               n_iter = n_iter, message = message)
        
        instance(bracket)
        
    elif method in OPEN_METHODS:
        
        solver = OPEN_METHODS[method]
        
        instance = solver(fun = fun, stop_criteria = stop_criteria, etol = etol,
               n_iter = n_iter, message = message)
        
        instance(x0)
    
    else:
        
        raise NotImplementedError("Method was not implemented or it does not exist.")
    
    if history:
        return instance.x_sol, instance.residuals
    
    else:
        return instance.x_sol


def solve_poly(coefs, x0 = None, bracket = None, dfun = None, ddfun = None,
                 method = 'DurandKernerSeidel', h = 1e-8, etol = 1e-8, n_iter = 50,
                 stop_criteria = 'absolute_error', m_stop_criteria = 'li_absolute_error',
                 message = True, history = True):
    
    if method in POLY_SCALAR_METHODS:
        
        solver = POLY_SCALAR_METHODS[method]
        
        roots = []
        residuals = []
        
        roapp = roots.append
        reapp = residuals.append
        
        while len(coefs) > 3: 
            
            instance = solver(coefs=coefs, stop_criteria = stop_criteria, etol = etol,
               n_iter = n_iter, message = message)
            
            instance(x0)
            
            coefs = instance.fun.deflation(instance.x_sol).coefs
            
            roapp(instance.x_sol)
            reapp(instance.residuals)
            
        if len(coefs) == 3:
            
            c, b, a = coefs
            
            pm = np.array([1, -1])
            
            r1, r2 = (-1*b + pm * (b**2 - 4*a*c) ** 0.5) / (2 * a)
            
            roapp(r1)
            roapp(r2)
            
    elif method in POLY_MULTI_METHODS:
        
        solver = POLY_MULTI_METHODS[method]
        
        instance = solver(coefs=coefs, stop_criteria = m_stop_criteria, etol = etol,
           n_iter = n_iter, message = message)
        
        instance(x0)
        
        roots = instance.x_sol
        residuals = instance.residuals
        
    else:
        
        raise NotImplementedError("Method was not implemented or it does not exist.")
        
        
    if history:
        return roots, residuals
    
    else:
        return roots
    
        

        
    
        
        
    
    
            
            
            
        
        
        
        






    