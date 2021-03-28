function [magnetLost, magnetFound] = detectMagnetLostAndFound(measures, lastMeasures)
% This function returns the number of magnet lost and found.

% The dectectChange function requires that no magnet detected is coded as -1 in the measure
% vector, that is why we add the value -1 at the end of our vector when it
% is needed.

measures = addValueToMeasurements(measures,-1);
lastMeasures = addValueToMeasurements(lastMeasures,-1);

noMagnetValue = -1;
zerosDiff = sum(lastMeasures == noMagnetValue)-sum(measures == noMagnetValue);

magnetLost = detectChange(measures,lastMeasures);
magnetFound = magnetLost + zerosDiff;
end

