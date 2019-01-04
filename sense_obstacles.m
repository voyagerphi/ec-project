% Measures the surroundings of the robot and draws it in the figure
function [measU, measR, measD, measL] = sense_obstacles(robPos, mMap, sensorU, sensorR, sensorD, sensorL )

    mapPos = [robPos(1), robPos(2)];
    measU = 0;
    measR = 0; 
    measD = 0; 
    measL = 0;

    % Check Up 
    if mapPos(2) >= size(mMap, 2)
        sensorU.FaceColor = [1 0.01 0.01];
        measU = 1;
    else
        if mMap(mapPos(1), mapPos(2) + 1) == -1
            sensorU.FaceColor = [1 0.01 0.01];
            measU = 1;
        else
            sensorU.FaceColor = [1 1 1]; 
        end
    end

    % Check Right
    if mapPos(1) >= size(mMap, 1)
        sensorR.FaceColor = [1 0.01 0.01];
        measR = 1;
    else
        if mMap(mapPos(1) + 1, mapPos(2)) == -1
            sensorR.FaceColor = [1 0.01 0.01];
            measR = 1;
        else
            sensorR.FaceColor = [1 1 1]; 
        end
    end

     % Check Down
    if mapPos(2) - 1 <= 0
        sensorD.FaceColor = [1 0.01 0.01];
        measD = 1;
    else
        if mMap(mapPos(1), mapPos(2) - 1 ) == -1
            sensorD.FaceColor = [1 0.01 0.01];
            measD = 1;
        else
            sensorD.FaceColor = [1 1 1]; 
        end
    end

    % Check Left
    if mapPos(1) - 1 <= 0
        sensorL.FaceColor = [1 0.01 0.01];
        measL = 1;
    else
        if mMap(mapPos(1) - 1, mapPos(2)) == -1
            sensorL.FaceColor = [1 0.01 0.01];
            measL = 1;

        else
            sensorL.FaceColor = [1 1 1]; 
        end
    end

end