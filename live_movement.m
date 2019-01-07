function live_movement(src,~, OBS_ID,EMP_ID, startText)

    % Hide Button
    src.Visible = 'off';
    startText.Visible = 'off';
    if isMultipleCall();  return;  end

    % End Program Control
    mContinue = true;
    % Move Counter
    N_MOVE = 0;

    % Get Current Figure
    myFigure = gcf;

    winW = myFigure.Position(3); 
    winH = myFigure.Position(4);
    
    [nMovesText, errorObs, fInfo] = live_gui(myFigure, winW,winH);

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
    [iDistribution, mapMatrix] = get_initial_distribution(nEmpty, mapMatrix, OBS_ID);    

    % Compute Transition Matrix
    transitionMatrix = compute_transition(mapMatrix, OBS_ID);

    % Compute Observations Matrix
    observationMatrix = compute_observation_matrix(mapMatrix, OBS_ID);
    
    % Initialize robot
    % Get robot initial position and draw robot
    [mRobotPlot, mRobotPos] = init_robot(myFigure, mapMatrix, ax, OBS_ID);
    
    % Get First Observation
    [measU, measR, measD, measL] = sense_obstacles(mRobotPos, mapMatrix, sensorU, sensorR, sensorD, sensorL);
    
    % Get First Estimate
    observationVector = [measU measR measD measL];
    mapMatrix = first_estimate(mapMatrix, iDistribution, observationMatrix, observationVector, OBS_ID);
    
    % Refresh Map
    refresh_map(mapMatrix, mapDrawing, OBS_ID)


    while true
        waitforbuttonpress
        mKey = get(gcf, 'CurrentKey');
        
        % Finish if f is pressed
        if mKey == 'f'
            break;
        end

        % Move according to command
        switch (mKey)            
            case 'uparrow'
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(1, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
            case 'rightarrow'
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(2, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
            case 'downarrow'
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(3, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
            case 'leftarrow'
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(4, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
            case 'space'
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(0, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
            otherwise
                [N_MOVE, mRobotPos, mRobotPlot] = move_robot(0, mapMatrix, mRobotPos, mRobotPlot, N_MOVE, nMovesText, errorObs, OBS_ID);
        end

         % Take Measurements
        [measU, measR, measD, measL] = sense_obstacles(mRobotPos, mapMatrix, sensorU, sensorR, sensorD, sensorL);

        % Update the recursion estimate
        observationVector = [measU measR measD measL];
        mapMatrix = update_estimate(mapMatrix, transitionMatrix, observationMatrix, observationVector, OBS_ID);
        
        % Refresh map with probabilities
        refresh_map(mapMatrix, mapDrawing, OBS_ID)       

    end
    
    delete(fInfo) 
    src.Visible = 'on';
    startText.Visible = 'on';
    delete(ax)
    delete(ax2)
end
