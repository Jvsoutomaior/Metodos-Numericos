function x = GaussPivot (A, b)
##Resolve sistema de equações lineares [A][x] = [b] por Gaus com pivotação

##variaveis de entrada:
## [A] - matriz de conficientes
## [b] - vetor coluna contendo as constantes do lado direito do sitema
## variaveis de saida:
## [x] - vetor coluna com solução

%%como declara matriz   matrix = [1 2 3; 4 5 6; 7 8 9]
%{
1 2 3
4 5 6
7 8 9
%}
%% como delclara vetor  vetor[1: 1 : 10]
%{
1 2 3 4 5 6 7 8 9 10
%}

Ab = [A,b]; % concatenar matriz A com vetor b
[R,C] = size(Ab); % Extrair o numero de linhas R e numero de colunas C da matriz Ab

for j = 1:R-1
  %%Inicio da seção de pivotação
  if Ab(j,j) == 0
    for k = j+1:R
      if Ab(K,j) ~= 0
        AbTemp = Ab(j,:);
        Ab(j,:) = Ab(K,:);
        Ab(k,:) = AbTemp;
        break
      endif
    endfor
  endif
  %%Fim da seção de pivotação

%Triangularização superior do sistema - Gauss
  for i = j+1:R
    Ab(i,j:C) = Ab(i,j:C) - Ab(i,j)/Ab(j,j)*Ab(j,j:C);
  endfor
endfor

%solução direta do sistema triangular superior
x = zeros(R,1);
x(R) = Ab(R,C)/Ab(R,R);
for i = R-1:-1:1
  x(i) = (Ab(i,C)-Ab(i,i+1:R)*x(i+1:R))/Ab(i,i);
endfor

endfunction
