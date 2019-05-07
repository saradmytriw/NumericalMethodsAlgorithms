
%Sara Dmytriw
%March 4, 2019
%False Position RootFinder

%Inputs
    %func-the function being evaluted
    %xl-the lower guess
    %xu-the upper guess
    %es-the desired relative error
    %maxiter-the number of desired iterations
%Outputs
    %root-the estimated root location
    %fx-the function evaluated at the root location
    %ea-the approximate relative error
    %iter-how many iterations were performed

function[root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)

%input argument check
if nargin==3
    es=0.0001;
    maxiter=200;
end
if nargin==4
    if isempty(es)==1
        es=0.0001;
    else 
        maxiter=200;
    end
end
%check for sign change between guesses
%fxu=func evaluated at upper guess
fxu=func(xu);
%fxl=func evaluated at lower guess
fxl=func(xl);
sign_check=xor(abs(fxu)==fxu,abs(fxl)==fxl);
if sign_check==0
    error('There is no root between your initial guesses')
end

%Calculate the root using fasle position method
%The loop stops when the approximate error becomes smaller than the
%stopping criterion
%The loop is broken when the number of iterations becomes equal to the
%maximum number of iterations
i=0;
ea=100;
root=xl;
while ea>es
    %determining approximate error
    root_old=root;
    root=xu-((fxu*(xl-xu))/(fxl-fxu));
    ea=abs((root-root_old)*100/root);
    %determining f(root)
    froot=func(root);
    %assigning new bounds for next iteration
    if fxl>0 && froot>0
        xl==root;
    elseif fxl<0 && root<0
        xl==root;
    else
        xu==root;
    end
    %determining number of iterations
    i=i+1;
    if i==maxiter
        break
    end 
end

%outputs
root=root
fx=func(root)
ea=ea
iter=i



