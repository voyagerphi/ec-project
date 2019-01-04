% Moves robot if there is no obstacle in the future position
    function [nMoves, mRobotPos, mRobotPlot] = move_robot(direction, mMap, mRobotPos, mRobotPlot, nMoves, nMovesText, errorObs, OBS_ID)  
        errorObs.Visible =  'off';
        nextPosition = mRobotPos;
        switch(direction)
            case 1
                nextPosition(2) = nextPosition(2) + 1;
            case 2
                nextPosition(1) = nextPosition(1) + 1; 
            case 3
                nextPosition(2) = nextPosition(2) - 1;
            case 4
                nextPosition(1) = nextPosition(1) - 1;
            otherwise
                nextPosition = mRobotPos;                 
        end
        % Check if inside map
         if nextPosition(1) < 1 || nextPosition(2) < 1  
            nextPosition = mRobotPos; 
            errorObs.Visible =  'on';
            return;
        end
        if nextPosition(1) > size(mMap, 1) || nextPosition(2) > size(mMap, 2)            
            nextPosition = mRobotPos;
            errorObs.Visible =  'on';
            return;
        end 
        % Check if there is obstacle
        if mMap(nextPosition(1), nextPosition(2)) == OBS_ID            
            nextPosition = mRobotPos;
            errorObs.Visible =  'on';
            return;
        end
       
        mRobotPos = nextPosition;
        mRobotPlot.Position = [nextPosition(1), nextPosition(2), 1,1];
        
        nMoves = nMoves + 1;
        nMovesText.String =  num2str(nMoves);
                        
    end