function c = newtonint(x,y)
n = length(x);
c = y;
c(2) = (y(2)-y(1))/(x(2)-x(1));
for i = 3 : n
    numerator = y(i)-y(1);
    for j = 2 : i - 1
        m = 1;
        for k = 1 : j-1
            m = m * ( x(i)-x(k) );
        end
        numerator = numerator - c(j)*m;
    end
    denominator = 1;
    for z = 1 : i-1
        denominator = denominator * (x(i)-x(z));
    end
    c(i) = numerator / denominator;
end
end