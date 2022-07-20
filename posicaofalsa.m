clear all; close all; clc;

%definindo a função a ser analisada
F = @(x) 8-4.5*(x-sin(x));

%Definir intervalos iniciais de análise
a = 2;
b = 3;

%Quantidade máxima de iterações permitidas
imax = 50;

%Tolerancia para o resultado final
tol = 1e-3;

%Avaliar a função nos limites do intervalos
Fa = F(a);
Fb = F(b);

if Fa*Fb > 0 disp ('Erro: não há raiz no intervalo')
else disp('iter      a           b       ponto medio   F(PM)    tolerancia')

  for i = 1:imax

    PM = (a*Fb-b*Fa)/(Fb-Fa); %calcula o ponto onde a reta cruza o eixo x

    tol_i = (b-a)/2; % calcula a tolerancia
    FPM = F(PM); %avalia a função no ponto médio
    fprintf('%3i %11.6f %11.6f %11.6f %11.6f %11.6f\n', i, a, b, PM, FPM, tol_i)

    %Estabelecer criterio de parada com base na tolerancia estipulada
    if tol_i < tol
      break
    endif

##if i = imax
##  fprint('Soluão não encontrada com %i iterações', imax)
##  break
##endif

    if F(a)*FPM<0
      b = PM;
    else
      a = PM;
    endif

  endfor
endif


