% R E C T A   P A R A M E T R I Z A D A   E N   E L   C U B O   R G B

% Definimos los parámetros de la recta (como en el scipt 'RectaR3.m'):

P = [0.6,0.2,0]; %Punto inicial de la recta
Q = [0.5,0.8,0.3]; %Punto final de la recta
V = Q-P; % Definimos el vector director
t = linspace(0, 1, 1000); % Rango del parámetro t de 0 a 1 con 100 puntos

% Luego, definimos las ecuaciones paramétricas:
x = P(1) + V(1) * t; % Coordenada x
y = P(2) + V(2) * t; % Coordenada y
z = P(3) + V(3) * t; % Coordenada z

% Cada coordenada corresponderá a un color de las coordenadas del cubo,
% entonces tenemos lo siguiente:
color = [x(:), y(:), z(:)];

%------Ahora, el cubo:
[Xc, Yc, Zc] = meshgrid([0 1], [0 1], [0 1]);
plot3(Xc(:), Yc(:), Zc(:),'ko') % La opción 'ko' indica:
% Grafica los puntos como círculos negros sin líneas que los conecten.
hold on % Necesario para graficar más de una función en la misma gráfica

% Agregamos la gráfica de la recta:
scatter3(x, y, z, 36, color, 'filled')

%Ajustes de la gráfica:
xlabel('R'), ylabel('G'), zlabel('B')
title('Recta en el cubo RGB')
axis equal
grid on
view(3)

hold off