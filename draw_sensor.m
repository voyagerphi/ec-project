% Draws the sensor indicators and returns the respective handles
function [sUP, sDN, sLT, sRT] = draw_sensor(mFigure, sensorAx, senW)
    figure(mFigure)        
    % Surround
    rectangle(sensorAx,'Position',senW * [0.2 0.2 0.5 0.5],'FaceColor',[1 1 1],'LineWidth',2, 'Curvature',0.05);         
    % Robot
    rectangle(sensorAx,'Position',senW * [0.4 0.4 0.1 0.1],'FaceColor',[1 0 0],'LineWidth',1, 'Curvature',1);        
    % Up
    sUP = rectangle(sensorAx,'Position',senW * [0.4 0.55 0.1 0.1],'FaceColor',[1 1 1],'LineWidth',2, 'Curvature',0.05); 
    % Down
    sDN = rectangle(sensorAx,'Position',senW * [0.4 0.25 0.1 0.1],'FaceColor',[1 1 1],'LineWidth',2, 'Curvature',0.05); 
    % Left
    sLT = rectangle(sensorAx,'Position',senW * [0.25 0.4 0.1 0.1],'FaceColor',[1 1 1],'LineWidth',2, 'Curvature',0.05); 
    % Right
    sRT = rectangle(sensorAx,'Position',senW * [0.55 0.4 0.1 0.1],'FaceColor',[1 1 1],'LineWidth',2, 'Curvature',0.05); 

end   