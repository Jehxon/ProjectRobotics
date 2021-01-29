function [magnetLost, magnetFound] = detectChange2(measures, lastMeasures)
% This function returns the number of magnet lost or found. This is a
% number between -2 and +2.

noMagnetValue = -1;
zerosDiff = sum(lastMeasures == noMagnetValue)-sum(measures == noMagnetValue);

magnetLost = detectChange(measures,lastMeasures);
magnetFound = magnetLost + zerosDiff;
end

