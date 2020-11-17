function [Q] = simpson(f,a,b,n)
interval_num = n;
h = (b-a)/interval_num;
t = [a+h:h:b-h];
t2im1 = t(1:2:end);
t2i = t(2:2:end);
A = arrayfun(f,t2im1);
B = arrayfun(f, t2i);
A = A.*4;
B = B.*2;
summation = f(a) + f(b) + sum(A) + sum(B);
Q = h/3*summation;
end
