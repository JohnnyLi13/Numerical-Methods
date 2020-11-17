function [A,l] = gauss_p(A);
B = A;
[n1,n2] = size(A);
n = n1;
m = zeros(n);
M1 = eye(n);
L = eye(n); %tracking lower triangle
P = eye(n); %permutation assignment for each reference row
Pl = zeros(n); Pl(1:1+size(Pl,1):end) = 1; %tracking permutation
S = zeros(n,1);
ABSX = abs(A);
RV = zeros(1,n);
for row  = 1:n
    S(row) = max( ABSX(row,:) );
end
%disp("S vector:");
%disp(S);
for RefRow = 1:n-1 %for reference row
    RefCol = A(:,RefRow);
    %disp("RefCol:"); disp(RefCol);
    RV = abs(RefCol ./ S);
    %disp("ratio vector:"); disp(RV);
    LargestRow = getLargestRow(RV,RefRow);
    if(RefRow ~= LargestRow)
        P = genP(n, RefRow, LargestRow);
    else
        P = eye(n);
    end
    %disp("P:"); disp(P);
    A = P*A; %swap rows through permutation
    %disp("A:"); disp(A);
    for RowbelowRef = RefRow + 1 : n %for rows below reference row
        m(RowbelowRef, RefRow) = A(RowbelowRef, RefRow) / A(RefRow, RefRow);
        %disp( m(RowbelowRef, RefRow));
        M1(RowbelowRef,RefRow) = -m(RowbelowRef, RefRow);
        %disp("M:"); disp(M1);
    end
    Pl = P*Pl;
    L = L*inv(P)*inv(M1);
    A = M1*A;
    %disp("A:"); disp(A);
    M1 = zeros(n);
    M1(1:1+size(M1,1):end) = 1;
end
l = Pl;
%disp("final P:"); disp(l);
%disp("final U:"); disp(A);
L = Pl*L;
%disp("final L:"); disp(L);
%disp(L*A);
%disp("A approximate"); disp(inv(l)*L*A);
for i = 2:n
    for j = 1:i-1
        A(i,j) = L(i,j);
    end
end
end
%main function above
%help functions down here
function r = getLargestRow(RV,RR)
[rows,c] = size(RV);
r = 0;
largestnum = 0;
for row = RR : rows
    if( abs(RV(row, 1)) > largestnum)
        largestnum = abs(RV(row,1));
        r = row;     
    end
end
end
%
function P = genP(n,refrow,largestrow)
P = zeros(n);
for ele = 1:n
    if (ele == refrow)
        P(refrow,largestrow) = 1;
    elseif (ele == largestrow)
        P(largestrow,refrow) = 1;
    else
        P(ele,ele) = 1;
    end
end
end