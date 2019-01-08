function refresh_map(mMap, mDrawing, OBS_ID)
        for i=1:1:size(mMap,1)
            for j=1:1:size(mMap,2)
                if mMap(i,j) ~= OBS_ID
                    
                    % Color Scale Interpolation
                    cScale = [1 1 1; 1 1 0; 0.8 0.8 0; 0 0.7 0; 0 0.4 0];                    
                    xScale = [0 0.000001 0.05 0.5 1];                    
                    mColor = interp1(xScale, cScale, mMap(i,j));                    
                    mDrawing.mapPos{i,j}.FaceColor = mColor;                                                              
                    
                end
            end
        end
    end