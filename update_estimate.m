function mapMatrix = update_estimate(mapMatrix, transitionMatrix, observationMatrix, observationVector, OBS_ID)
    
    oldMap = mapMatrix;
    normSum = 0;
    
    for i=1:1:size(mapMatrix, 1)
        for j=1:1:size(mapMatrix, 2)
            
            if mapMatrix(i,j) ~= OBS_ID 
                sum = 0;
                newState = get_element_from_map(i,j,oldMap);
                
                for i2=1:1:size(mapMatrix, 1)
                    for j2=1:1:size(mapMatrix, 2)
                        
                        if mapMatrix(i2,j2) ~= OBS_ID 
                            oldState = get_element_from_map(i2,j2,oldMap);                                                
                            a = get_transition_likelihood(oldState, newState, transitionMatrix, oldMap);
                            sum = sum + a * oldMap(i2, j2);
                        end

                    end                
                end

                b = get_observation_likelihood(newState, observationVector, observationMatrix);           
                mapMatrix(i, j) = b * sum;
                
                % DEBUG
                if mapMatrix(i, j) < 0 || isnan(mapMatrix(i,j))
                   dbstop 
                end                
                normSum = normSum + mapMatrix(i,j);  
            end            
        end
    end        
    
    % Normalize
    [mapMatrix] = normalize_elements(normSum, mapMatrix, OBS_ID); 
    
    
    function mLike = get_transition_likelihood(old, new, transitionMatrix, mMap)        
        
        % If tests fail it is zero
        mLike = 0;
        
        % Likelihood of not moving
        if new == old
           mLike = transitionMatrix(old, 1); 
           return;
        end
        
        % Likelihood of going up 
        if new - size(mMap,1)== old 
            mLike = transitionMatrix(old, 2); 
            return;
        end
        
        % Likelihood of going right 
        if new - 1 == old 
            mLike = transitionMatrix(old, 3); 
            return;
        end
        
        % Likelihood of going down 
        if new + size(mMap,1)== old 
            mLike = transitionMatrix(old, 4); 
            return;
        end
        
        % Likelihood of going right 
        if new + 1 == old 
            mLike = transitionMatrix(old, 5); 
            return;
        end
        
    end
    

end
