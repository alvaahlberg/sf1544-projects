function [A] = matrixA(values)
%Function that defines the matrix A from inputs

m1 = values(1);
m2 = values(2);
k1 = values(3);
k2 = values(4);
c1 = values(5);
c2 = values(6);

A = [0 0 1 0
    0 0 0 1 
    -(k1/m1) (k1/m1) -(c1/m1) (c1/m1)
    (k1/m2) -((k1+k2)/m2) (c1/m2) -((c1+c2)/m2)];

end