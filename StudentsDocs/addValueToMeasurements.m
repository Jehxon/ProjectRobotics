function newMeasures = addValueToMeasurements(measures, value)

% This function add the value "value" as many times as necessary to the
% input vector in order to make it compatible with the detectChange
% function.

newMeasures = measures;

if(length(measures) == 2)
    return;
else
    newMeasures(2) = value;
    if(isempty(measures))
        newMeasures(1) = value;
    end
end

end
