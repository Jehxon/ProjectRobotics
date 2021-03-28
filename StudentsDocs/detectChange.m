function changes = detectChange(measures, lastMeasures)
% This function detects if the robot went past a magnet between the last
% measure and the current measure.
% It returns the number of magnets that the robot stopped detecting.

% It is required that no magnet detected is coded as -1 in the measure
% vector.


noMagnetValue = -1;
changes = 2;
limit = 2;

% If there is at most one magnet detected in the old measure, then we must
% only check the first measure of lastMeasures and we have at most one
% magnet lost. We do that in order not to compare no magnet with no magnet,
% and finding a false match.
if(lastMeasures(2) == noMagnetValue)
    limit = 1;
    changes = 1;
    % If lastMeasures is empty, there can be no magnet loss, so we return
    % 0.
    if(lastMeasures(1) == noMagnetValue)
        changes = 0;
        return;
    end
end

% We compare each measure from lastMeasures to each measures in the current
% measure, if the values match (one unit or less appart) then we remove one
% magnet from the counter, because there is one magnet that is still
% detected.
for i = 1:limit
    for j = measures
        if(abs(lastMeasures(i)-j) <= 1)
            changes = changes - 1;
            break;
        end
    end
end

changes = max(changes,0);


end
