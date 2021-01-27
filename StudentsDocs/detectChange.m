function changes = detectChange(measures, lastMeasures)
% This function detects if the robot went past a magnet between the last
% measure and the current measure.
% It returns the number of magnets that the robot stopped detecting.

% It is required that no magnet detected is coded as -1 in the measure vector.

noMagnetValue = -1;
changes = 2;
limit = 2;


if(lastMeasures(2) == noMagnetValue)
    limit = 1;
    changes = 1;
    if(lastMeasures(1) == noMagnetValue)
        changes = 0;
        return;
    end
end

for i = 1:limit
    for j = measures
        if(abs(lastMeasures(i)-j) <= 1)
            changes = changes - 1;
            break;
        end
    end
end

changes = max(changes,0);


%{
changed = sum(abs(measures-lastMeasures) > 0.5);

if(lastMeasures(2) == noMagnetValue)
    
    if(lastMeasures(1) == noMagnetValue)
        changed = 0;
        return;
    end
    
    
    if(measures(2) == noMagnetValue)
        changed = abs(measures(1)-lastMeasures(1)) > 0.5;
        return;
    end
    
   % aled
    
    
end


if(measures(2) == noMagnetValue)
    changed = 1 + abs(measures(1)-lastMeasures(2)) > 0.5;
end
%}





%{
% If both measures are perfectly equal or really close, there is no change
if(not(any(abs(measures-lastMeasures) > 0.5)))
    return;
end


% If we go from 2 measures to none
if(all(lastMeasures > 0) && all(measures == noMagnetValue))
    changed = 2;
    return;
end

% If we have 2 measures magnets in the last measure but only 1 in the
% current measure, there is one change
if(measures(2) == noMagnetValue && all(lastMeasures ~= noMagnetValue))
    changed = 1;
    return;
end

if(all(measures == noMagnetValue) && any(lastMeasures ~= noMagnetValue))
    changed = 1;
end
%}

end