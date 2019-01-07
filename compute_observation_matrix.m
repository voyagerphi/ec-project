function mObservationMat = compute_observation_matrix(mMap, OBS_ID)

    mObservationMat = ones(size(mMap,1), 4);

    for i = 1:1:size(mMap,1) 
        for j = 1:1:size(mMap,2)        
            % Get possible obstacles
            mObservationMat(i + size(mMap,1)*(j-1),:) = possible_obstacles(i, j, mMap, OBS_ID);            
        end        
    end    

    function [observationRow] = possible_obstacles(x, y, mMap, OBS_ID)
        % [Up Right Down Left]
        observationRow = zeros(1,4);
        
        % Check above
        if y + 1 > size(mMap,2)
            observationRow(1) = 1;
        else
            if mMap(x, y + 1) == OBS_ID   
                observationRow(1) = 1;
            end
        end
        
        % Check right
        if x + 1 > size(mMap,1)
            observationRow(2) = 1;
        else
            if mMap(x + 1, y) == OBS_ID   
                observationRow(2) = 1;
            end
        end
        
        % Check down
        if y - 1 <= 0
            observationRow(3) = 1;
        else
            if mMap(x, y - 1) == OBS_ID   
                observationRow(3) = 1;
            end
        end
        
        % Check left
        if x - 1 <= 0
            observationRow(4) = 1;
        else
            if mMap(x - 1, y) == OBS_ID   
                observationRow(4) = 1;
            end
        end
                
    end

end