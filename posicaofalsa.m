clear all; close all; clc;

%definindo a fun��o a ser analisada
F = @(x) 8-4.5*(x-sin(x));

%Definir intervalos iniciais de an�lise
a = 2;
b = 3;

%Quantidade m�xima de itera��es permitidas
imax = 50;

%Tolerancia para o resultado final
tol = 1e-3;

%Avaliar a fun��o nos limites do intervalos
Fa = F(a);
Fb = F(b);

if Fa*Fb > 0 disp ('Erro: n�o h� raiz no intervalo')
else disp('iter      a           b       ponto medio   F(PM)    tolerancia')

  for i = 1:imax

    PM = (a*Fb-b*Fa)/(Fb-Fa); %calcula o ponto onde a reta cruza o eixo x

    tol_i = (b-a)/2; % calcula a tolerancia
    FPM = F(PM); %avalia a fun��o no ponto m�dio
    fprintf('%3i %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, PM, FPM, tol_i)

    %Estabelecer criterio de parada com base na tolerancia estipulada
    if tol_i < tol
      break
    endif

##if i = imax
##  fprint('Solu�o n�o encontrada com %i itera��es', imax)
##  break
##endif

    if F(a)*FPM<0
      b = PM;
    else
      a = PM;
    endif

  endfor
endif


