function p = matrixToVector(P)
 %Transform Matrix P into a vector
    a = 1;
    for h = 1:1:3
        for j = 1:1:3
        p(a,:) = P(h,j);
        a = a + 1;
        end
    end
end