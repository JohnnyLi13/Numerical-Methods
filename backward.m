function x = backward(A,b,l);
%disp(A);
b = l*b; % inv(l) * L * U * x = b ==> L*U*x = l*b [n1,n2] = size(A);
n = n1;
x = zeros(1,n); y = zeros(1,n);
L = restoreL(A); U = restoreU(A);
%disp("b:"); disp(b);
%disp("U:"); disp(U);
%disp("L:"); disp(L);
%solve for L*y = b;
y(1) = b(1) / L(1,1);
for k = 2:n
    SUM = 0;
    for j = 1 : k-1
        SUM = SUM + L(k,j)*y(j);
end
    y(k) = (b(k) - SUM ) / L(k,k);
end
%solve for U*x = y;
x(n) = y(n) / U(n,n);
for k = n-1 : -1 : 1
    SUM = 0;
    for j = k+1 : n
        SUM = SUM + U(k,j)*x(j);
end
    x(k) = (y(k) - SUM ) / U(k,k);
end
%disp("y:"); disp(y);
%disp("x:"); disp(x);
end