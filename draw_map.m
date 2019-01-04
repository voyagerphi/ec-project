% Draws the map stored in the matrix read from the file
function  [mDrawing] = draw_map(mapFig, mMap, plotAxis, OBS_ID) 
    cla(plotAxis)

    mTop = size(mMap,1) + 1;
    mLen = size(mMap,2) + 1;

    mDrawing = {};
    mDrawing.mapPos = cell(size(mMap));


    for i =1:1:size(mMap,1)            
        % Draw Outter Obstacles
        figure(mapFig)     
        rectangle(plotAxis,'Position',[i,0,1,1],'FaceColor',[0 0 0],'LineWidth',2, 'Curvature',0.05);
        rectangle(plotAxis,'Position',[i,mLen,1,1],'FaceColor',[0 0 0],'LineWidth',2, 'Curvature',0.05);
        for j=1:1:size(mMap,2)                                
            % Draw Inner Obstacles
            if mMap(i,j) == OBS_ID
                figure(mapFig)     
                mDrawing.mapPos{i,j} = rectangle(plotAxis,'Position',[i,j,1,1],'FaceColor',[0 0 0],'LineWidth',0.01, 'Curvature',0.05);
            else
                mDrawing.mapPos{i,j} = rectangle(plotAxis,'Position',[i,j,1,1],'FaceColor',[1 1 1],'LineWidth',0.01, 'Curvature',0);
            end
        end
    end
    % Draw Top and Bottom Obstacles
    for j=1:1:size(mMap,2)+2                                               
        figure(mapFig)     
        rectangle(plotAxis,'Position',[0,j-1,1,1],'FaceColor',[0 0 0],'LineWidth',2, 'Curvature',0.05);    
        rectangle(plotAxis,'Position',[mTop,j-1,1,1],'FaceColor',[0 0 0],'LineWidth',2, 'Curvature',0.05); 
    end
end       