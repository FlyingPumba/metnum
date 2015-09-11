function Lch = CholFromLU(A)
    
    if CheckCondChol(A) == 0
        error('NO CHOLE ACCEPTED')
    end

    % Conseguir factorizacion LU de A (help lu)
    [L,U,P] = lu(A);
    
    % Conseguir L de cholesky a partir de LU
    Lch = L*((U*inv(L'))^(1/2)); % Quien es la L de Cholesky?    
    
    % Codigo para chequar que dio bien
    Ach = Lch*Lch'; % Reconstruimos.
    Lchole = chol(A);
    for i = size(A,1)
        for j = size(A,2)
            if abs(A(i,j) - Ach(i,j)) > 0.0001 | abs(Lch(i,j) - Lchole(i,j)) > 0.0001
                error('ERROR: CHOLE NOT FOUND')
            end
        end
    end
end

