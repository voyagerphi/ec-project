function mTransitionMat = compute_transition(mMap, OBS_ID)

    mTransitionMat = ones(size(mMap,1), 5);

    for i = 1:1:size(mMap,1) 
        for j = 1:1:size(mMap,2)        
            % Count possible transitions
            mTransitionMat(i + size(mMap,1)*(j-1),:) = possible_transitions(i, j, mMap, OBS_ID);            
        end        
    end    

    function [transitionRow] = possible_transitions(x, y, mMap, OBS_ID)
        
        % It is always possible to stay in the same state
        nTransition = 1;
                
        % [None Up Right Down Left]
        transitionRow = ones(1,5);
        
        % Check above
        if y + 1 > size(mMap,2)
            transitionRow(2) = 0;
        else
            if mMap(x, y + 1) == OBS_ID   
                transitionRow(2) = 0;
            else
                nTransition = nTransition + 1;
            end
        end
        
        % Check right
        if x + 1 > size(mMap,1)
            transitionRow(3) = 0;
        else
            if mMap(x + 1, y) == OBS_ID   
                transitionRow(3) = 0;
            else
                nTransition = nTransition + 1;
            end
        end
        
        % Check down
        if y - 1 <= 0
            transitionRow(4) = 0;
        else
            if mMap(x, y - 1) == OBS_ID   
                transitionRow(4) = 0;
            else
                nTransition = nTransition + 1;
            end
        end
        
        % Check left
        if x - 1 <= 0
            transitionRow(5) = 0;
        else
            if mMap(x - 1, y) == OBS_ID   
                transitionRow(5) = 0;
            else
                nTransition = nTransition + 1;
            end
        end
        
        % Equally equal states
        transitionRow = transitionRow / nTransition;
                
    end
    
    
end