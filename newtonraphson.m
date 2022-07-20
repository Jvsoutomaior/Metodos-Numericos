clc; clear all; close all;

F = @(x) 8-4.5*(x-sin(x)); % Fun��o
D_fun = @(x) -4.5*(1-cos(x)); % derivada da fun��o
x0 = 2.5;
Err = 1e-5;
imax = 50;

for i = 1:imax
  xi = x0 - feval (F,x0) / feval(D_fun, x0);
  if abs((xi - x0)/x0)<Err
    xz = xi;
    break
  endif
  x0 = xi;
endfor

fprintf('Solu��o xz = 11.6f', xz)
fprintf('  , obtida em %i itera��es', i)


