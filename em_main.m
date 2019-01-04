function em_main()

    % Map Identifiers
    % -1 -> Obstacle
    %  ]0,1] -> Robot Probability
    OBS_ID = -1;
    EMP_ID =  0; % for map reading
       
    % Draw and initialize Window
    % Window Size
    winW = 900;
    winH = 500;
    
    % Generate figure/window
    mFigure = figure();
    mFigure.Position = [20 25 winW winH];               
    
    % Draw UI
    draw_gui(mFigure, winW, winH, OBS_ID, EMP_ID);        

    %%
    % Draws the user interface on the window and returns the respective
    % handles
    function [] = draw_gui(mFigure, winW, winH, OBS_ID, EMP_ID)
        figure(mFigure)
        
        % Help Text
        startText = uicontrol('Style', 'text', 'FontSize', 10, 'ForegroundColor', 'black');
        startText.Position = [0.01*winW 0.9*winH 0.3*winW 0.05*winH];
        startText.String =  'Press one option to start';
        
        % Buttons
        bLiveMove = uicontrol('Style', 'togglebutton', 'Callback', {@live_movement,OBS_ID,EMP_ID,startText});
        bLiveMove.Position = [0.05*winW 0.8*winH 0.2*winW 0.05*winH];
        bLiveMove.String =  'Live Move';
        
        bRandomMove = uicontrol('Style', 'pushbutton');
        bRandomMove.Position = [0.05*winW 0.725*winH 0.2*winW 0.05*winH];
        bRandomMove.String =  'Random Move';
        bRandomMove.Callback =  {@random_move,OBS_ID,EMP_ID,startText};                        
    end

end