function measure = exactMeasure(a,currentMeasure)
%This function returns the measure of the magnet we just lost selected from
%the part of the buffer a, given the current measure mes

  %The last measure of the buffer, containing the measure of the magnet we
  %lost
  lastMeasure = a(length(a)).M;
  
  %removing the zeros
  lastMeasure=lastMeasure(lastMeasure~=0);
  currentMeasure=currentMeasure(currentMeasure~=0);

  maxDist=0;
  maxDistIndex=1;

  %We compare the current measure to the last measure we got with the
  %lost magnet, and we keep the furthest measure from the current measure
  for i = 1:length(lastMeasure)
    for j= 1:length(currentMeasure)
      d = abs(lastMeasure(i)-currentMeasure(j));
      if (d>maxDist)
        maxDist = d;
        maxDistIndex = i;
      end
    end
  end
  
  %We then return the value of this measure at the middle of the measurment
  %a, because we suppose that this was the real value of the measure.
  measure = closest(a(round(length(a)/2)).M,lastMeasure(maxDistIndex));

end