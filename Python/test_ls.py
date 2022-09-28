# -*- coding: utf-8 -*-
"""
Created on Wed Sep  7 19:23:29 2022

@author: heito
"""

from ls_solver.direct_methods import LUSolver, GaussElimination
from ls_solver.iterative_methods import GaussSeidel, GaussJacobi
import numpy as np

M = np.genfromtxt('data/matriz1.txt', dtype='float64')

A = M[:, :-1]
b = M[:, -1]



sol0 = GaussElimination(A, b)
sol1 = LUSolver(A, b)
sol2 = LUSolver(A)
sol2.solve(b)
sol3 = GaussSeidel(A, b)
sol3([1, 1, 1])
sol4 = GaussJacobi(A, b)
sol4([1, 1, 1])

