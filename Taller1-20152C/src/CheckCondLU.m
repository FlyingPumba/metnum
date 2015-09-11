function ret = CheckCondLU(A)

tic
ret = 0;
for i = 1:size(A,1) % Completar rango para i (help size)
    if abs(det(A(1:i,1:i))) < 0.0001 % Completar condicion de corte. Si pasa, la funcion retorna false.
        return;
    end
end
ret = 1;
toc
