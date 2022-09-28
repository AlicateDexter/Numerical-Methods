# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 21:45:25 2022

@author: heito
"""

from nl_solver import solve_scalar, solve_poly
import numpy as np


def ex5_1(c):
    g = 9.81 ; m = 68.1
    t = 10 ; v = 40
    
    return g * m / c * (1 - np.exp(-t * c / m)) - v

def ex5_6(x): return x ** 10 - 1

def ex6_1(x): return np.exp(-1 * x) - x

def df_ex6_1(x): return -1 * np.exp(-1 * x) - 1

def ex6_11(x): return x ** 3 - 5 * x ** 2 + 7 * x - 3

result = solve_scalar(fun = ex5_1, bracket = [0.1, 30], method = 'Bisection')
print(result, end = '\n\n')
result = solve_scalar(fun = ex5_6, bracket = [0.1, 2], method = 'RegulaFalsi')
print(result, end = '\n\n')
result = solve_scalar(fun = ex5_6, bracket = [0.1, 2], method = 'ModRegulaFalsi')
print(result, end = '\n\n')
result = solve_scalar(fun = ex6_1, x0 = 0, method = 'FixedPoint')
print(result, end = '\n\n')
result = solve_scalar(fun = ex6_1, dfun = df_ex6_1, x0 = 0, method = 'NewtonRaphson')
print(result, end = '\n\n')
result = solve_scalar(fun = ex6_1, x0 = [0, 0.1], method = 'Secant')
print(result, end = '\n\n')
result = solve_scalar(fun = ex6_11, x0 = 0, method = 'Halley')
print(result, end = '\n\n')
result = solve_poly(coefs = [-12, -13, 0, 1], x0 = [1, 2., 1.5], method = 'DurandKernerSeidel')
print(result, end = '\n\n')
result = solve_poly(coefs = [-12, -13, 0, 1], x0 = [1, 2., 1.5], method = 'DurandKernerJacobi')
print(result, end = '\n\n')
result = solve_poly(coefs = [-12, -13, 0, 1], x0 = [1, 2., 1.5], method = 'Muller')
print(result, end = '\n\n')











