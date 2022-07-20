%limpando a tela, variavaeis...
clear all; close all; clc;

%definindo a fun��o:
F = @(x) 8-4.5*(x-sin(x));

%definir intervalos iniciais de an�lise:
% (olhar o grafico e verificar onde o 0 est� mais ou menos) nesse caso entre 2 e 3
a = 2;
b = 3;

%Quantidade maxima de itera��es permitidas:
imax = 50;

%tolerancia para o resultado final:
tol = 1e-2 %1e-2 significa 1*10^-2 (0,01)

%avaliar a fun��o nos limites do intervalo;
Fa = F(a);
Fb = F(b);

if Fa*Fb > 0 disp('N�o h� raiz no intervalo!')
else disp('iter      a           b       ponto medio   F(PM)    tolerancia')

for i = 1:imax

  PM = (a+b)/2; %Calcula o ponto m�dio do intervalo
  tol_i = (b-a)/2; %Calcula a tolerancia
  F_PM = F(PM); %Avalia a fun��o no ponto m�dio
  fprintf('%3i %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, PM, F_PM, tol_i)

    %estabelecer um criterio de parada com base na tolerancia maxima
    if tol_i < tol
      break
    endif

    if F(a)*F_PM < 0
      b = PM;
    else
      a = PM;
    endif

  endfor
endif

