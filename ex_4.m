% 4) Para a função 
%         f(x,y) =  xsen(4x) + 1,1 ysen(2y)  0  ≤ x ≤ 10,   0 ≤ y ≤ 10 
%    determine o valor mínimo absoluto da função e suas respectivas coordenadas 
%    usando: 
%
%     a) Busca exaustiva (precisão = 0,1) 
%
%     b)Busca exaustiva (precisão = 0,01) 
%
%     c)Busca exaustiva (precisão = 0,001) 

%     d)Comente os resultados (foi útil aumentar a granularidade?). 

close all;
clear all;

x1 = [0:0.1:10];
y1 = [0:0.1:10];
x2 = [0:0.01:10];
y2 = [0:0.01:10];
x3 = [0:0.001:10];
y3 = [0:0.001:10];

func_x1 = x1.*sin(4.*x1) + 1.1.*y1.*sin(2*y1);
func_x2 = x2.*sin(4.*x2) + 1.1.*y2.*sin(2*y2);
func_x3 = x3.*sin(4.*x3) + 1.1.*y3.*sin(2*y3);


minimo1 = min(func_x1);
maximo1 = max(func_x1);
minimo2 = min(func_x2);
maximo2 = max(func_x2);
minimo3 = min(func_x3);
maximo3 = max(func_x3);


%fplot("@(x1,y1) x*sin(4*x) + 1.1*y*sin(2*y)", [0, 10], "b");
%set(findall(gca, 'Type', 'Line'),'LineWidth',2);
%title("Grafico de f(x) = x*sin(10*pi*x) + 1", "fontsize", 18, "fontname", 'Arial');
%xlabel("x", "fontsize", 14);
%ylabel("y", "fontsize", 14);
%saveas (1, "grafico4.png");