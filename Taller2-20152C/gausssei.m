function [X] = gausssei(A,b,x0)
    D = diag(diag(A));
    L = tril(-A, -1);
    U = triu(-A, 1);
    C = inv(D - L)*b;
    T = inv(D - L)*U;
    X = x0;
    while (norm(A*X - b) > 0.000001)
        X = T*X + C;
    end
end
