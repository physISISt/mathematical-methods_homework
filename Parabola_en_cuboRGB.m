% P A R Á B O L A   P A R A M E T R I Z A D A   E N   E L   C U B O   R G B

% Como se plantea en 'ParabolaR3.m', la parametrización general de la
% parábola es:
%              r(t) = (x0, y0, z0) + vec{u}*t + a*t^2*vec{v}
% donde tenemos un punto inicial, un vector perpendicular vec{u} y un
% vector direccional vec{v}. Con ello, definimos dichas variables:

% Variables de r:
%   [r, g, b]
O = [0, 0.5, 0.5]; % Origen de la parábola
u = [0, 1, 0]; % Vector perpendicular
v = [1, 0.1, 0.3]; % Vector direccional
a = 4; % Coeficiente de la parábola
t = linspace(-1, 1, 1000); % Parámetro t para la parametrización
% Aumentar de -1,1 a -2,2 para que al rotar la parabola, tenga suficientes
% puntos para graficar toda la parábola dentro del cubo

%-------------------------° E J E M P L O S °-----------------------------
% x = ay^2 : u = [0, 1, 0], v = [1, 0, 0]
% y = az^2 : u = [0, 0, 1], v = [0, 1, 0]
% z = ax^2 : u = [1, 0, 0], v = [0, 0, 1]
% x = az^2 + y : u = [0, 1, 1], v=[1, 0 , 0] 
%-------------------------------------------------------------------------

% Parametrización de la parábola: %r = O + u .* t + a * (t.^2)' .* v;
r = O(1) + u(1)*t + a * (t.^2).* v(1);
g = O(2) + u(2)*t + a * (t.^2).* v(2);
b = O(3) + u(3)*t + a * (t.^2).* v(3);
%------------------------------° N O T A °---------------------------------
% El "." le indica que realice la operación elemento por elemento, y no de
% manera matricial para que no se genere un error si las dimensiones de las
% matrices no son compatibles
% El " ' " indica la transpuesta o transposición de los vectores
%--------------------------------------------------------------------------


% Cada coordenada corresponderá a un color de las coordenadas del cubo:
colores = [r', g', b']; % La ' hace la transpuesta para tener 
% vectores columnas, pues así los requiere la función scatter

%Ahora, definimos el cubo RGB:
[Xc, Yc, Zc] = meshgrid([0 1], [0 1], [0 1]);
plot3(Xc(:), Yc(:), Zc(:), 'ko') % La opción 'ko' indica:
% Grafica los puntos como círculos negros sin líneas que los conecten.

hold on % Necesario para graficar más de una función en la misma gráfica

%Agregamos la parábola:
scatter3(r, g, b, 36, colores, "filled")

%Ajustes de la gráfica:
xlabel('R'), ylabel('G'), zlabel('B')
title('Parábola en el cubo RGB')
grid on
% Ajustar los límites de los ejes para visualizar sólo la parte de la 
% parábola que está dentro del cubo
xlim([0 1]);
ylim([0 1]);
zlim([0 1]);
axis square
view(3)