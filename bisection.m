function [r, computed_error] = bisection(f_handler, lower_bound, upper_bound)

tol = 1e-13;
format long e;
r = (lower_bound+upper_bound)/2;
error = abs(f_handler(r));
counter = 0;

while error > tol
    if f_handler(lower_bound) * f_handler(r) < 0 %check sign change
        upper_bound = r;
    else
        lower_bound = r;
    end
    r = (lower_bound+upper_bound)/2;
    error = abs(f_handler(r));
end

fzero_root = fzero(f_handler, lower_bound);
computed_error = abs(r-fzero_root);

computed_root = r
fzero_root
computed_error

end
