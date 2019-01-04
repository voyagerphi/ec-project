function [nMove, eObs, fInfo] = live_gui(mFigure, winW, winH)

    figure(mFigure)
    % Text
    nMove = uicontrol('Style', 'text', 'FontSize', 14, 'ForegroundColor', 'black');
    nMove.Position = [0.25*winW 0.8*winH 0.15*winW 0.05*winH];
    nMove.String =  'Moves: ';

    % Text
    nMove = uicontrol('Style', 'text', 'FontSize', 14, 'ForegroundColor', 'black');
    nMove.Position = [0.4*winW 0.8*winH 0.05*winW 0.05*winH];
    nMove.String =  num2str(0);

    % Text
    eObs = uicontrol('Style', 'text', 'FontSize', 8, 'ForegroundColor', 'red');
    eObs.Position = [0.5*winW 0.9*winH 0.5*winW 0.1*winH];
    eObs.String =  'CAUTION!: That direction has an obstacle, try another move';
    eObs.Visible =  'off'; 
    
    % Text
    fInfo = uicontrol('Style', 'text', 'FontSize', 10, 'ForegroundColor', [0 0 0.3]);
    fInfo.Position = [0*winW 0.9*winH 0.5*winW 0.05*winH];
    fInfo.String =  'To end  this session press "f".';  
    fInfo.Visible =  'on'; 
end