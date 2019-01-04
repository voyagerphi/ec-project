    % Initializes the robot positiopm and draws it
    function [mRobotPlot, mRobotPos] = init_robot(mapFig, mMap, plotAxis, OBS_ID)
               
        % Generate Robot
        while(true)
            mRobotPos = randi([1 length(mMap)],[2,1]);
            if mMap(mRobotPos(1), mRobotPos(2)) ~= OBS_ID
                break
            end
        end
        
        % Draw Robot
        figure(mapFig)     
        mRobotPlot = rectangle(plotAxis,'Position',[mRobotPos(1),mRobotPos(2),1,1],'FaceColor',[1 0 0],'LineWidth',1, 'Curvature',1);

    end