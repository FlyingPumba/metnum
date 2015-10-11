function [X] = jacobi_matricial(A,b,x0)
    D = diag(diag(A));
    L = tril(-A, -1);
    U = triu(-A, 1);
    C = inv(D)*b;
    T = inv(D)*(L+U);
    X = x0;
    i = 0;
    while (norm(A*X - b) > 0.000001)
        X = T*X + C;
        i += 1;
    end
    i
end
