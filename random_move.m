% Moves the robot in a random direction (including not moving)
function random_move(src,~,OBS_ID,EMP_ID, startText)       

    src.Visible = 'off';
    startText.Visible = 'off';
    
    % Get Current Figure
    myFigure = gcf;

    winW = myFigure.Position(3); 
    winH = myFigure.Position(4);
    
    [nMovesText, errorObs, fInfo] = live_gui(myFigure, winW,winH);
    delete(fInfo);

    nMoves = 0;

    % Draw Plot Areas
    [ax, ax2, senW] = draw_plot(winW,winH);

    % Read Map
    [mapMatrix, nEmpty] = read_map(OBS_ID,EMP_ID);

    % Draw Map in figure
    axes(ax);
    mapDrawing = draw_map(myFigure, mapMatrix, ax, OBS_ID);        

    % Draw Sensor Indicators
    [sensorU, sensorD, sensorL, sensorR] = draw_sensor(myFigure, ax2, senW); 

    % Hidden Markov Model Parameters
    % Compute Initial Matrix
    [mPi, mapMatrix] = get_initial_distribution(nEmpty, mapMatrix, OBS_ID);
    refresh_map(mapMatrix, mapDrawing, OBS_ID)

    % Compute Transition Matrix
    %mTrasitionMat = compute_transition();

    % Compute Observations Matrix
    %mObservationMat = compute_observations();

    % Initialize robot
    % Get robot initial position and draw robot
    [mRobotPlot, mRobotPos] = init_robot(myFigure, mapMatrix, ax, OBS_ID);

    nSteps = inputdlg('Enter the number of movements of the robot.');

    mTimer = timer('TimerFcn',@(~,~)disp('Timer'), 'StartDelay', 1.5);
    for it= 1:1:str2double(nSteps{1}) 
        % Timer start
        start(mTimer)

        % Check if a move was made or if it tried to hit a wall
        nMovesPast = nMoves;
        while nMoves == nMovesPast
            [nMoves, mRobotPos, mRobotPlot] = move_robot(randi([0 4]), mapMatrix, mRobotPos, mRobotPlot, nMoves, nMovesText, errorObs, OBS_ID);
        end

        % Take Measurements
        [measU, measR, measD, measL] = sense_obstacles(mRobotPos, mapMatrix, sensorU, sensorR, sensorD, sensorL);

        % Update the recursion estimate
        %mapMatrix = update_estimate(mapMatrix, , mTrasitionMat, mObservationMat, measU, measR, measD, measL)

        % Refresh map with probabilities
        refresh_map(mapMatrix, mapDrawing, OBS_ID)

        % Wait a bit so that user can see results in map
        wait(mTimer)
    end

    
    startText.String = 'Press a key or click to end';
    startText.Visible = 'on';
    waitforbuttonpress    
    startText.String = 'Press any button to start';
    src.Visible = 'on';
    
    
    delete(ax)
    delete(ax2)

end