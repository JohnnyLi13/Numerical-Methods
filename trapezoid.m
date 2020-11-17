function [Q] = trapezoid (f,a,b,n)
interval_num = n;
h = (b-a)/interval_num;
finite_part = h/2*( f(a) + f(b) );
t = [a+h:h:b-h];
%disp(t);
A = arrayfun(f, t);
%disp(A);
A= h.*A;
loop_part = sum(A);
Q = finite_part + loop_part;
end