# -*- coding: utf-8 -*-
"""
Created on Wed Jul 20 21:37:37 2022

@author: heito
"""

from .solvers import solve_scalar, solve_poly
from .bases import BaseScalarSolver, BaseMultiSolver, BracketMethod
from .bases import OpenMultiMethod, OpenScalarMethod
from .bases import PolyMultiMethod, PolyScalarMethod
from .utils import IntervalError, Polynomial
from .bracket_methods import Bisection, RegulaFalsi, ModRegulaFalsi
from .open_methods import NewtonRaphson, Halley, Secant, FixedPoint
from .poly_methods import Muller, DurandKernerJacobi, DurandKernerSeidel

EPS = 1e-20