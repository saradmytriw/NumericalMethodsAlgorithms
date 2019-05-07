# falsePosition
This algorithm uses the False Position Method to estimate the roots of a function.
The False Position method uses two initial guesses that bracket the root in order to make an estimate by drawing a line between them. The x-intercept of this line is the estimate of the root. The sign of the evaluation of the function at this guess determines which bracket point is replaced by this estimate for the next iteration such that there is always a sign difference between the bracketing points.
This function asks the user to input a stopping criterion and the maximum number of iterations desired before the program stops running.

Inputs

    func - the function being evaluated
    xl - the lower guess of the bracket
    xu - the upper guess of the bracket
    es - the stopping criterion 
    maxiter - the maximum number of iterations the user desires
    
Outputs

    root - the estimated root location
    fx - the function evaluated at the root location
    ea - approximate relative error
    iter - how many iterations were performed
    
## Possible Improvements
1. The algorithm stops running after two iterations
2. The algorithm does not run until specified error is met
3. The algorithm does not converge to zero
4. The algorithm does not provide the correct answer
