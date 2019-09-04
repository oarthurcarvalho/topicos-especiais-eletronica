% 2) Para a função 
%     f(x) =  - 3 x4 + 16x3 - 18x2   -1 ≤ x ≤ 4
%
%   a) Faça o gráfico da função. 
%
%   b) Determine o valor máximo absoluto da função e o valor de x correspondente
%     usando: 
%         b.1) Método analítico 
%         b.2) Busca exaustiva (precisão = 0,1) 
%
%   c) Comente os resultados.

close all;
clear all;

limites = [-1, 4];

f = [3 -16 18 0 0];
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

%------------------------------------- b.1 -----------------------------------------

x = [-1:0.1:4];
y = polyval(f, x);

fprintf('\n \n Letra B.1:\n \n');

idx = find(y==max(y));
fprintf('O ponto máximo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));

idx = find(y==min(y));
fprintf('O ponto mínimo absoluto é (%4.3f, %4.3f)\n', x(idx), y(idx));

fplot("3*x^4 - 16*x^3 + 18*x^2", [-1, 4], "b");
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
title("Grafico de f(x) = 3x^{4} - 16x^{3} + 18x^{2}", "fontsize", 18, "fontname", 'Arial');
xlabel("x", "fontsize", 14);
ylabel("y", "fontsize", 14);
saveas (1, "/home/arthurcarv/Documents/Projects/topicos-especiais-eletronica/grafico2.png");