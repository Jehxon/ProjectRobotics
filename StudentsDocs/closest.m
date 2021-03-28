function closestValue = closest(vec,val)
%This function returns the closest value of val in a given vector vec

    %removing zeros
    vec = vec(vec~=0);
    
    distMin = 100;

    for v = vec
        d = abs(v-val);
        if(d<distMin)
            distMin = d;
            closestValue = v;
        end
    end

end

