function [Q] = midpoint(f,a,b,n)
interval_num = n;
h = (b-a)/interval_num;
t = [a+h/2:h:b-h/2];
%disp(t);
A = arrayfun(f,t);
A = A.*h;
Q = sum(A);
end