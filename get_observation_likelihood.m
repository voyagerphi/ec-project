function oLike = get_observation_likelihood(state, observationVector, observationMatrix)         
    if observationVector == observationMatrix(state,:)
        oLike = 1;
    else
        oLike = 0;
    end                
end