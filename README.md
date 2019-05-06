# NumericalMethodsAlgorithms
These are the numerical methods algorithms I created while in Mech 105
## falsePosition
This algorithm uses the False Position method to obtain the roots of a function.

Inputs 

    func - the function being evaluted 
    xl - the lower guess
    xu - the upper guess
    es - the desired relative error
    maxiter  -the number of desired iterations
    
Outputs

    root - the estimated root location
    fx - the function evaluated at the root location
    ea - the approximate relative error
    iter - how many iterations were performed
    
## luFactor
The algorithm uses LU Decomposition to produce L and U matrices which can be used to solve a system of equations. It also makes use of partial pivoting as tracked by the P matrix.

Inputs

    A - a coefficient matrix equivalent to the system of equations
    
Outputs

    L - the lower triangular matrix
    U - the upper triangular matrix
    P - the pivot matrix
    
## Simpson
This algorithm makes use of the Simpson's 1/3 Rule to integrate tabulated data. The algorithm will make use of the trapezoidal rule in the case that the data requires it because of the number of terms.

Inputs

    x - the vector of values that the integral will be taken with respect to
    y - the vector of function values that correlate to x
    
Outputs

    I - the integral
    
## Disclaimer
None of these algorithms are perfect and could all use some improvements
