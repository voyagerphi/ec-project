% Reads a file with map instructions and extracts its values to a
% matrix
function [mapMatrix, emptyCount] = read_map(OBS_ID,EMP_ID)      

    % Initial Height
    mapHeight = 0;

    % Empty Cell Count
    emptyCount = 0;

    % Open file and read two headers
    fileMap= fopen('map_file.txt');
    [~] = fgets(fileMap);        
    mapWidth = str2double(fgets(fileMap));
    [~] = fgets(fileMap);

    % Routine that reads the map into a matrix
    while true

        % Read map line
        MAP = fread(fileMap, mapWidth, 'uint8');
        % Test End of File
        if feof(fileMap)
            break
        end
        % Update Height
        mapHeight =  mapHeight + 1;
        % Read new line character
        [~] = fread(fileMap, 1, 'uint8');
        for j = 1:1:length(MAP)
            switch(MAP(j))
                case '-'
                    mMap(mapHeight,j) = OBS_ID;
                case '0'
                    mMap(mapHeight,j) = EMP_ID;
                    emptyCount = emptyCount + 1;
                otherwise 
                    mMap(mapHeight,j) = OBS_ID;
            end
        end
    end

    % Close File
    fclose(fileMap);

    % Transpose Coordinates
    mMap = mMap';

    % Revert y axis
    temp = mMap;
    for i = 1:1:size(mMap,2)
        mMap(:,i) = temp(:,1+size(mMap,1)-i);
    end

    % Return Map
    mapMatrix = mMap;        
end