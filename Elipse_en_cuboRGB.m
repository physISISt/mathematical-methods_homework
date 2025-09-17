% E L I P S E   E N   E L   C U B O   R G B

% Definimos los valores de la parametrización de la elipse:

c = [0.5, 0.5, 0.5]; % Centro de la elipse
theta = linspace(0, 2*pi, 1000); % Parámetro t
a = 0.7; m = 1; % Semiejes mayor y menor, respectivamente
% Que sus valores sean menores a 1 para poder visualizarlos dentro del cubo


% Parametrización:
x = a * cos(theta); % Coordenadas x de la elipse
y = m * sin(theta); % Coordenadas y de la elipse
z = zeros(size(theta)); %Coordenada z de la elipse
elipse = [x; y; z];

% Definimos una matriz de rotación:
phi = pi/4;  % Ángulo de rotación (en radianes)

% Matriz de rotación alrededor del eje X
Rx = [0.5 0 0;
      0 cos(phi) -sin(phi);
      0 sin(phi) cos(phi)];


% Aplicamos la rotación a la elipse:
%elp_rot = Rx * elipse;

% Movemos el centro de la elipse:
%elp_rot = elipse + c';

r = x + c(1);
g = y + c(2);
b = z + c(3);

%-------G R A F I C O
% Cada coordenada corresponderá a un color de las coordenadas del cubo:
%colores = [elp_rot(1)', elp_rot(2)', elp_rot(3)']; % La ' hace la transpuesta para tener 
% vectores columnas, pues así los requiere la función scatter

colores = [r', g', b'] ;

% Normalizar colores entre 0 y 1
%colores = elp_rot';  % Transpuesta para tener 10 filas (una por punto)
colores = max(min(colores, 1), 0);  % Asegura que estén en [0,1]

% Ahora, definimos el cubo RGB:
[Xc, Yc, Zc] = meshgrid([0 1], [0 1], [0 1]);
plot3(Xc(:), Yc(:), Zc(:), 'ko') % La opción 'ko' indica:
% Grafica los puntos como círculos negros sin líneas que los conecten.

hold on % Necesario para graficar más de una función en la misma gráfica

%Agregamos la elipse:
%scatter3(elp_rot(1), elp_rot(2), elp_rot(3), 36, colores, "filled")
scatter3(r, g, b, 36, colores, "filled")

%Ajustes de la gráfica:
xlabel('R'), ylabel('G'), zlabel('B')
title('Elipse en el cubo RGB')
grid on
axis equal
view(3)
