% 3) Para a função 
%      f(x) =  xsen(10πx) + 1     -1 ≤ x ≤ 2
%
%     a) Faça o gráfico da função. 
%
%     b) Determine   x0e  f(x0)│ f(x0)≥ f(x)x  Є [-1, 2] usando: 
%       b.1) Método analítico 
%       b.2) Busca exaustiva (precisão = 0,1) e (precisão = 0,01). Comente os 
%            resultados (a precisão   influenciou o resultado?). 

close all;
clear all;

pkg load symbolic;

syms x;

limites = [-1, 4];

f = x*sin(10*pi*x) + 1;
primeiraDerivada = diff(f);
fx = function_handle(f);
primeiraDerivada = function_handle(primeiraDerivada);

raizesPrimeiraDerivada = [];

%Encontrar as raízes da equação primeiraDerivada

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



x = [-1:0.1:2];

func_x2 = x.*sin(10.*pi.*x) + 1;
func_x3 = x.*sin(10.*pi.*x) + 1;

fplot("x*sin(10*pi*x) + 1", [-1, 2], "b");
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
title("Grafico de f(x) = x*sin(10*pi*x) + 1", "fontsize", 18, "fontname", 'Arial');
xlabel("x", "fontsize", 14);
ylabel("y", "fontsize", 14);
saveas (1, "/home/arthurcarv/Documents/Projects/topicos-especiais-eletronica/grafico3.png");