function Lch = CholFromBlocks(A)

    if CheckCondChol(A) == 0
        error('NO CHOLE ACCEPTED')
    end

    n = size(A,1);

    % Obtengo cholesky de una dimension menos, es decir, de A_{n-1}
    L = chol(A(1:n-1,1:n-1));
    
    % Calculo los valores que faltan y armo el resultado. Hacer primero las cuentas en papel! Pregunta: Quien es el menor principal de (n-1)x(n-1)?
    ultFila = (L \ A(1:n-1,n:n))'; % Ultima fila de la L de Cholesky (Lch)
    ultElem = (A(n,n) - ultFila'*ultFila)^(1/2); % Elemento (n+1,n+1) de la L de Cholesky (Lch)
    Lch = [L zeros(size(L,1),1); ultFila ultElem];
    
    
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

