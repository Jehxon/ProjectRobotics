function newMeasures = addNegativeOnesToMeasurments(measures)

% This function add -1 as many times as necessary to the input vector in 
% order to make it compatible with the detectChange function.

newMeasures = measures;

if(length(measures) == 2)
    return;
else
    newMeasures(2) = -1;
    if(isempty(measures))
        newMeasures(1) = -1;
    end
end

end

