function [mMap] = normalize_elements(sum, mMap, OBS_ID)    
    for i=1:1:size(mMap,1)
        for j=1:1:size(mMap,2)
            if mMap(i,j) ~= OBS_ID
                mMap(i,j) = mMap(i,j) / sum;
            end
        end
    end
end