function [r, computed_error] = newton(f, x0)
format long e;
syms x;

tol = 1e-13;
max_iter = 1e10;
r = x0;
counter = 0;
df = diff(f, x);
DF = matlabFunction(df);
F = matlabFunction(f);
y_eval = feval(F,r);
dy_eval = feval(DF,r);
disp("fraction: " + y_eval/dy_eval);

while( (abs(y_eval) > tol) && (counter < max_iter) )
    %disp("fraction: " + y_eval/dy_eval);
    r = r - y_eval/dy_eval;
    %disp("r: " + r);
    y_eval = feval(F,r);
    dy_eval = feval(DF,r);
    counter = counter + 1;
end

%fzero_root = fzero(F, x0);
fsolve_root = fsolve(F, x0);
computed_error = abs(r-fsolve_root);

counter
computed_root = r
%fzero_root
fsolve_root
computed_error

end
