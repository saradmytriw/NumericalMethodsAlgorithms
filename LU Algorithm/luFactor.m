%Sara Dmytriw
%April 3, 2019
%LU Decomposition

%Inputs:
    %A - a coefficient matrix equivalent to the system of equations
%Outputs:
    %L - the lower triangular matrix
    %U - the upper triangular matrix
    %P - the pivot matrix
    
function[L,U,P]=luFactor(A)

A=input('Input your coefficient matrix ');

x=nargin('luFactor');
if x~=1
    error('One input is required')
end

size=length(A);
P=eye(size);

%pivot for 1st column
%find largest first place coefficient
column_one=A(:,1);
[largest,max_index]=max(abs(column_one));
%switch the largest and the first rows
P_piv=P;
P_piv(max_index,:)=P(1,:);
P_piv(1,:)=P(max_index,:);
A_piv=P_piv*A;

%eliminate
%starting place for A prime
A_prime=A_piv;
%normalization factors
L21=A_piv(2,1)/A_piv(1,1);
L31=A_piv(3,1)/A_piv(1,1);
%norm1 = normalized row 1 of A_piv by L21
norm1=L21*A_piv(1,:);
A_prime(2,:)=A_piv(2,:)-norm1;
%norm2 = normalized row 1 of A_piv by L31
norm2=L31*A_piv(1,:);
A_prime(3,:)=A_piv(3,:)-norm2;

%store normalization factors
L=P;
L(2,1)=L21;
L(3,1)=L31;

%pivot for 2nd column
%find largest coefficient in the 2nd column ignoring the 1st row
coeff=A_prime(:,2);
coeff(1,1)=0;
[largest2,max_index2]=max(abs(coeff));
%switch the largest and the second rows for the A matrix
%A_dprime = A double prime
A_dprime=A_prime;
A_dprime(2,:)=A_prime(max_index2,:);
A_dprime(max_index2,:)=A_prime(2,:);
%edit the pivot matrix
P=P_piv;
P(2,:)=P_piv(max_index2,:);
P(max_index2,:)=P_piv(2,:);
%switch the largest coefficient and the one in the 2nd row for the L matrix
old_L=L;
L(2,1)=old_L(max_index2,1);
L(3,1)=old_L(2,1);

%eliminate A(3,2)
L32=A_dprime(3,2)/A_dprime(2,2);
L(3,2)=L32;
%norm3 = normalized row 2 of a double prime by L32
norm3=L32*A_dprime(2,:);
U=A_dprime;
U(3,:)=A_dprime(3,:)-norm3;

%display final product matrices
fprintf('L=\n')
disp(L)
fprintf('U=\n')
disp(U)
fprintf('P=\n')
disp(P)

end

