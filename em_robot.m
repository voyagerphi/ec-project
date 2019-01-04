%% Generate the map
% -1 -> Obstacle
%  0 -> Empty
%  ]0,1] -> Robot Probability
obsID = -1;
empID =  0;


% Size of square map side
mSize = 20;

% Outer box of matrix is ocuppied, hence size + 2
mMap = ones(mSize + 2, mSize + 2);

% Open file and read two headers
fileMap= fopen('map_file.txt');
[~] = fgets(fileMap);
[~] = fgets(fileMap);


% Routine that reads the map into a matrix
for i=1:1:mSize + 2
    % Read map line
    MAP = fread(fileMap, mSize + 2, 'uint8');
    % Read new line character
   [~] = fread(fileMap, 1, 'uint8');
    for j = 1:1:length(MAP)
        switch(MAP(j))
            case '-'
                mMap(j,mSize + 3 - i) = obsID;
            case '0'
                mMap(j,mSize + 3 - i) = empID;
            otherwise 
                mMap(j,mSize + 3 - i) = obsID;
        end
    end
end

% Close File
fclose(fileMap);


%% Generate Robot
while(true)
    mRobotPos = randi(length(mMap),[2,1]);
    if mMap(mRobotPos(1), mRobotPos(2)) ~= obsID
        break
    end
end


%% Plot Map

% Generate map figure 
mapFig = figure;

% Draw Obstacles
for i =1:1:length(mMap)
    for j=1:1:length(mMap)
        if mMap(i,j) == -1
            figure(mapFig)     
            rectangle('Position',[i,j,1,1],'FaceColor',[0 0 0],'LineWidth',2, 'Curvature',0.05)
        end
    end
end

% DrawRobot
figure(mapFig)     
rPlot = rectangle('Position',[mRobotPos(1),mRobotPos(2),0.7,0.7],'FaceColor',[1 0 0],'LineWidth',1, 'Curvature',1);


% Text
pt1t = uicontrol('Style', 'text', 'FontSize', 16, 'ForegroundColor', 'green');
pt1t.Position = [30 500 40 40];
pt1t.String =  num2str(0);

% Simulate Movement
for i=1:1:10
    waitforbuttonpress
    nextPosition = mRobotPos;
    while(true)
        nextMove = randi([0,4]);
        switch(nextMove)
            case 1
                nextPosition(2) = nextPosition(2) + 1;
            case 2
                nextPosition(1) = nextPosition(1) + 1; 
            case 3
                nextPosition(2) = nextPosition(2) - 1;
            case 4
                nextPosition(1) = nextPosition(1) - 1; 
                
        end
        if mMap(nextPosition(1), nextPosition(2)) ~= -1
            break
        end
    end
    mRobotPos = nextPosition;
    rPlot.Position = [nextPosition(1), nextPosition(2), 0.7,0.7 ];
    pt1t.String =  num2str(i);
end

