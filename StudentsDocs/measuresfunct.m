function measure = measuresfunct(c)

for i = 1 : length(c)/2
    a(i,1)=c(2*i-1);
    a(i,2)=c(2*i);
end
    measure = sum(a(round(length(a)/2),:))/2;
   if(a(round(length(a)/2),2) == 0)
        measure = a(round(length(a)/2),1);
        return;
   end

    for i = 1 : length(a)
        mag = a(i,2);
        if(mag == 0)
            meas = a(i,1);
            measobj1 = a(round(length(a)/2),1);
            measobj2 = a(round(length(a)/2),2);
            if (abs(meas-measobj1)<abs(meas-measobj2))
                measure = measobj1;
            else
                measure = measobj2;
            end
            return;
        end
    end

    

end