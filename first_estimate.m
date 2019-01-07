function mapMatrix = first_estimate(mapMatrix, iDistribution, observationMatrix, observationVector, OBS_ID)
    
    nSum = 0;

    for i=1:1:size(mapMatrix, 1)
        for j=1:1:size(mapMatrix, 2)
            if mapMatrix(i,j) ~= OBS_ID 
                state = get_element_from_map(i, j, mapMatrix);
                b = get_observation_likelihood(state, observationVector, observationMatrix); 
                mapMatrix(i,j) = b * iDistribution(state);                
                nSum = nSum + mapMatrix(i,j);    
                
                % DEBUG
                if mapMatrix(i,j)< 0 || isnan(mapMatrix(i,j))
                   dbstop 
                end
            end
        end
    end
        
    [mapMatrix] = normalize_elements(nSum, mapMatrix, OBS_ID); 
    
end