% 1) Para a função 
% f(x) =  x3 - 3x2 + 1        -1/2≤ x ≤ 4 
%
% a) Faça o gráfico da função. 
%
% b) Determine os valores absolutos máximo e mínimo da função e os valores de x 
%    correspondentes usando: 
%    b.1) Método analítico 
%    b.2) Busca exaustiva (precisão = 0,1) 
%    b.3) Busca exaustiva (precisão = 0,01) 
%
% c) Comente os resultados.

close all;
clear all;

limites = [-0.5, 4];

f = [1 -3 0 1];
primeiraDerivada = polyder(f);
raizesPrimeiraDerivada = roots(primeiraDerivada)';

intervalo = [raizesPrimeiraDerivada, limites];
intervalo = sort(intervalo);

resultado_intervalo = [];
tendencia = [];

for k = 1:length(intervalo)-1
  media = (intervalo(k) + intervalo(k+1)) / 2;
  resultado_intervalo(k) = polyval(primeiraDerivada, media);
  
  if (resultado_intervalo(k) > 0)
    tendencia(k) = 1;
  else
    tendencia(k) = 0;
  end
end

resultado_pontos = [];

for k = 1:length(intervalo)
  resultado_pontos(k) = polyval(f, intervalo(k));
  
  if k - 1 == 0
    
    if tendencia(k) == 1
      fprintf('O ponto (%4.3f, %4.3f) é um ponto mínimo\n', intervalo(k), resultado_pontos(k));
    else
      fprintf('O ponto (%4.3f, %4.3f) é um ponto máximo\n', intervalo(k), resultado_pontos(k));
    end
    
  elseif k > length(tendencia)
    
    if tendencia(k - 1) == 1
      fprintf('O ponto (%4.3f, %4.3f) é um ponto máximo\n', intervalo(k), resultado_pontos(k));
    else
      fprintf('O ponto (%4.3f, %4.3f) é um ponto mínimo\n', intervalo(k), resultado_pontos(k));
    end
    
  else
    
    if tendencia(k) == 0 && tendencia(k-1) == 1
      fprintf('O ponto (%4.3f, %4.3f) é um ponto máximo\n', intervalo(k), resultado_pontos(k));
    elseif tendencia(k) == 1 && tendencia(k-1) == 0
      fprintf('O ponto (%4.3f, %4.3f) é um ponto mínimo\n', intervalo(k), resultado_pontos(k));
    end
    
  end
  
end

fplot("x^3 - 3*x^2 + 1", [-0.5, 4], "b");
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
title("Grafico de f(x) = x³ - 3x² + 1", "fontsize", 18, "fontname", 'Arial');
xlabel("x", "fontsize", 14);
ylabel("y", "fontsize", 14);
saveas (1, "/home/arthurcarv/Documents/Projects/topicos-especiais-eletronica/grafico1.png");

%------------------------------------- b.1 -----------------------------------------

x = [-0.5:0.1:4];
y = polyval(f, x);

fprintf('\n \n Letra B.1:\n \n');

idx = find(y==max(y));
fprintf('O ponto máximo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));

idx = find(y==min(y));
fprintf('O ponto mínimo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));

%------------------------------------- b.2 -----------------------------------------

x = [-0.5:0.01:4];
y = polyval(f, x);

fprintf('\n \n Letra B.2:\n \n');

idx = find(y==max(y));
fprintf('O ponto máximo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));

idx = find(y==min(y));
fprintf('O ponto mínimo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));