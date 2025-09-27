% M A T R I C E S   D E   L A S   T R A N S F O R M A C I O N E S
%          L I N E A L E S   D E L   T R I Á N G U L O

% Definimos las matrices de las transf. lineales 2x2
 % Matriz neutra (identidad), N:
 N = eye(2); 

 % Matriz de rotación en 2pi/3, R:
 theta = (2*pi)/3; % Ángulo de rotación en radianes
 rotR = [cos(theta), -sin(theta); sin(theta), cos(theta)];

 % Matriz de rotación en -2pi/3, W:
 thetap = (-2*pi)/3;
 rotW = [cos(thetap), -sin(thetap); sin(thetap), cos(thetap)];

 % Matriz de reflexión en y, σ:
 reflexSigma = [-1, 0; 0, 1];

 % Matriz de reflexión en y=x, σ':
 reflexSigmaP = [0.5, sqrt(3)/2; sqrt(3)/2, -0.5];


 % Matriz de reflexión en y=-x, σ'':
 reflexSigmaPP = [0.5, -sqrt(3)/2; -sqrt(3)/2, -0.5]; 
 
% Definimos los vértices del triángulo equilátero (verticesIniciales)
vertI = [-0.5, -sqrt(3)/6; 0.5, -sqrt(3)/6; 0, sqrt(3)/3]; %2x3

% Aplicamos las transformaciones al triángulo
verN = (N * vertI')';

vertR = (rotR * vertI')'; 

vertW = (rotW * vertI')';

vertS = (reflexSigma * vertI')';

vertSp = (reflexSigmaP * vertI')';
%vertSp = vertcat((reflexSigmaP * vertI(1,:)' + t1')', (reflexSigmaP *
%vertI(2,:)' + t1')', (reflexSigmaP * vertI(3,:)' + t1')'); 

vertSpp = (reflexSigmaPP * vertI')';
%vertSpp = vertcat((reflexSigmaPP * vertI(1,:)' + t2')', (reflexSigmaPP * vertI(2,:)' + t2')', (reflexSigmaPP * vertI(3,:)' + t2')');



%Por último, graficamos
%figure;
%hold on;
%fill(vertI(:,1), vertI(:,2), 'r', 'FaceAlpha', 0.5, 'DisplayName', 'Original');
%fill(verN(:,1), verN(:,2), 'g', 'FaceAlpha', 0.5, 'DisplayName', 'Neutro');
%fill(vertR(:,1), vertR(:,2), 'b', 'FaceAlpha', 0.5, 'DisplayName', 'Rotación 2\pi/3');
%fill(vertW(:,1), vertW(:,2), 'm', 'FaceAlpha', 0.5, 'DisplayName', 'Rotación -2\pi/3');
%fill(vertS(:,1), vertS(:,2), 'c', 'FaceAlpha', 0.5, 'DisplayName', 'Reflexión σ');
%fill(vertSp(:,1), vertSp(:,2), 'y', 'FaceAlpha', 0.5, 'DisplayName', "Reflexión σ'");
%plot(x, y1, 'y', '--', 'DisplayName',"Eje σ'");
%fill(vertSpp(:,1), vertSpp(:,2), 'k', 'FaceAlpha', 0.5, 'DisplayName', "Reflexión σ''");
%plot(x, y2, 'k', '--', 'DisplayName',"Eje σ''");
%axis equal;
%legend show;
%title('Transformaciones Lineales del Triángulo');
%hold off;

% Preparar figura con 6 subplots
figure;
titles = {'Identidad (N)', 'Rotación 2\pi/3 (R)', 'Rotación -2\pi/3 (W)', ...
          'Reflexión en \sigma', 'Reflexión en \sigma'' ', 'Reflexión en \sigma'''' '};
transforms = {verN, vertR, vertW, vertS, vertSp, vertSpp};

for i = 1:6
    subplot(2,3,i);
    
    % Triángulo original
    fill(vertI(:,1), vertI(:,2), [0.8 0.8 1], 'EdgeColor', 'k', 'LineWidth', 1.5);
    hold on;
    
    % Triángulo transformado
    fill(transforms{i}(:,1), transforms{i}(:,2), [1 0.6 0.6], 'EdgeColor', 'r', 'LineWidth', 1.5);
    
    axis equal;
    axis([-1 1 -1 1]);
    title(titles{i}, 'FontSize', 12);
    xlabel('x'); ylabel('y');
    grid on;
end
