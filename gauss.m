function A = gauss(A);
    [n1,n2] = size(A);
    n = n1;
    m = zeros(n);
    M1 = zeros(n);
    M1(1:1+size(M1,1):end) = 1; %initialize the diagonal values to be 1
    L = zeros(n);
    L(1:1+size(L,1):end) = 1; %initialize the lower triangle
    %getting M1
    for RefRow = 1:n-1
        for RowbelowRef = RefRow+1 : n
            m(RowbelowRef, RefRow) = A(RowbelowRef, RefRow) / A(RefRow, RefRow);
        end
        L = L*inv(M1);
        A = M1*A;
        M1 = zeros(n);
        M1(1:1+size(M1,1):end) = 1;
    end
    %now A is actually the upper triangle
    %fprintf("L:\n"); disp(L);
    %fprintf("U:\n"); disp(A);
    %disp(L*A);
    %now concatenating lower and upper traingles into matrix A:
    for i = 2:n
        for j = 1:i-1
            A(i,j) = L(i,j);
        end
    end
end

function L = restoreL(A) %restore lower triangle
[n1,n2] = size(A);
n = n1;
L = zeros(n); L(1:1+size(L,1):end) = 1; %tracking lower triangle
for i = 2:n
    for j = 1:i-1
        L(i,j) = A(i,j);
end end
end
function U = restoreU(A) %restore upper triangle
[n1,n2] = size(A);
n = n1;
U = zeros(n);
for i = 1:n
    for j = i:n
        U(i,j) = A(i,j);
end end
end
%help functions end