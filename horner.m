function p = horner(c,x,X)
n = length(X);
lc = length(c);
p = zeros(1,n);
p = p + c(1);
for pi = 1:n %for each X that wanted to be evaluated
    for t = 2:lc %get each term of the polynomial for X(i) m = 1;
        for multi = 1:t-1  %get the multiplication terms
            m = m * ( X(pi)-x(multi) );
        end
        term = c(t) * m;
        %disp(term);
        p(pi) = p(pi) + term;
        %add all the terms to get p(i)
    end
end
end