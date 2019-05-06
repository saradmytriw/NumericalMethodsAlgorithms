
%Sara Dmytriw
%April 19, 2019
%Simpson Algorithm

%Inputs
    %x-the vector of values that the integral will be taken with respect to
    %y-the vector of function values that correlate to x
%Outputs
    %I-the integral

function[I]=Simpson(x,y)

%check that the lengths of x and y match
A=length(x)==length(y);
if A==0
    error('The variables x and y must contain the same number of terms')
end

%check that x and y are vectors
rowx=length(x(:,1));
rowy=length(y(:,1));
if rowx~=1
    error('The variable x must be entered as a vector')
end 
if rowy~=1
    error('The variable y must be entered as a vector')
end 

%check if trapezoidal rule is necessary for last term
size=length(x);
B=(size/2)==round(size/2);
if B==1
    warning('In order to approximate, one iteration of the trapezoidal rule will be necessary over the last interval')
end 

%check for equal spacing
EqualCheck=diff(x);
check=[];
j=1;
while j<=(length(EqualCheck)-1)
    LogicalCheck=EqualCheck(j)==EqualCheck(j+1);
    check=[check, LogicalCheck];
    j=j+1;
end 

One=ones(1, length(x)-2)
if One~=check
    error('The values of x must be equally spaced')
end 

%set up for loops
i=1;
x0=x(i);
x1=x(i+1);
x2=x(i+2);

%determines I based on need for trap rule or not
h=EqualCheck(1);
I=0
if size==1
    while i<=(size-2)
        fx0=y(i);
        fx1=y(i+1);
        fx2=y(i+2);
        I=(h/3)*(fx0+4*fx1+fx2);
        i=i+1;
    end 
else 
    limit=size-3;
    while i<=limit
        fx0=y(i);
        fx1=y(i+1);
        fx2=y(i+2);
        I=I+(h/3)*((fx0)+(4*fx1)+(fx2));
        i=i+2;
    end
    a=x(size-1);
    b=x(size);
    I=I+((b-a)*0.5*(y(size)+y(size-1)));
end

disp('The integral for these values is: ')
end 




