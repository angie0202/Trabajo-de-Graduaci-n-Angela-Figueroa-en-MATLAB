clc; clear; close all;

% -------------------------------------------------------------------------
% Conexión con Robotat
% -------------------------------------------------------------------------
addpath('robotat');               % Asegúrate de que la carpeta esté en el path
r = robotat_connect();            % Conecta con Robotat/OptiTrack
marker_id = 90;                   % ID del marker que quieres rastrear

disp('Presiona Ctrl+C para detener la ejecución.');

while true
    % Obtener posición del marker
    pos = r.getMarker(marker_id);  % Devuelve [x y z] o [] si no detecta
    
    if isempty(pos)
        fprintf('Marker %d no detectado\n', marker_id);
    else
        fprintf('Marker %d -> x: %.3f, y: %.3f, z: %.3f\n', marker_id, pos(1), pos(2), pos(3));
    end
    
    pause(0.05);  % Pequeña pausa para no saturar la consola
end
