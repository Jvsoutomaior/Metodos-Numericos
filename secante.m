clc; clear all; close all;

F = @(x) 8-4.5*(x-sin(x)); % Função

Err = 1e-3;
imax = 50;
a = 2;
b = 3;

for i = 1:imax
  Fa = feval(F, b);
  Fb = feval(F, a);

  xi = b - Fb*(a-b)/Fa/Fb;
  if abs ( (xi - b)/ b < Err )
    xz = xi;
    break
  endif
  a = b;
  b = xi;
endfor

fprintf('solução de xz = %11.6f', xz)
fprintf(' , obtida em %i iterações', i)

