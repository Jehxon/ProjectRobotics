function measure = measuresfunct(a,mes)

  %remove zeros
  a=a(a~=0);
  mes=mes(mes~=0);

  maxDist=0;
  maxDistIndex=1;

  for i = 1:length(a)
    for j= 1:length(mes)
      d = abs(a(i)-mes(j));
      if (d>maxDist)
        maxDist = d;
        maxDistIndex = i;
      end
    end
  end
  measure = a(maxDistIndex);

end