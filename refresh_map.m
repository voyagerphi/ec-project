function refresh_map(mMap, mDrawing, OBS_ID)
        for i=1:1:size(mMap,1)
            for j=1:1:size(mMap,2)
                if mMap(i,j) ~= OBS_ID
                    mDrawing.mapPos{i,j}.FaceColor = [1 1 1-mMap(i,j) ];
                end
            end
        end
    end