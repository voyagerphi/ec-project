 function [initialVector, mMap] = get_initial_distribution(nEmptyCells, mMap, OBS_ID)
        
        initialVector = zeros( size(mMap,1) * size(mMap,2) ,1);
        
        for i=1:1:size(mMap,1)
            for j=1:1:size(mMap,2) 
                if mMap(i,j) ~= OBS_ID
                    initialVector(i + j * size(mMap,1)) = 1/nEmptyCells;
                    mMap(i,j) = 1/nEmptyCells;
                end
            end
        end                    
    end