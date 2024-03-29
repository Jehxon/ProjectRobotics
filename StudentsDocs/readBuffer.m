function [data,indicesRead] = readBuffer()

global head
global tail1
global tail2
global buffer 
global rank_
global isFull
global isEmpty
global usT1
global usT2

warning = 0;
if(isFull == 1)
    warning = 1;
    isFull = 0;
end


if(isEmpty == 1)
    disp ('The buffer is empty');
else

% Check which tail we use

if(usT1 < usT2)
    tail = tail2;
    usT2 = usT2 - 1;
else
    tail = tail1;
    if(warning == 1)
        usT1 = 0;
    else
        usT1 = usT1 - 1;
    end
    
end

indicesRead = [];
% When head is at the beginning of the buffer and tail at the end,we adjust
% the index t

if(head - tail < 0)
    t = -(rank_ - tail);
elseif(warning == 1)
    t = head -rank_;
else
    t = tail;
end

% Read data from the buffer
data = struct;

for f = 1 : head-t
    data(f).X = buffer(tail).X;
    data(f).P = buffer(tail).P;
    %data(f).Y = buffer(tail).Y;
    data(f).U = buffer(tail).U;
    data(f).T = buffer(tail).T;
    data(f).M = buffer(tail).M;
    indicesRead = [indicesRead tail];

    tail = tail + 1;

% If we arrive to the end -> reset index

    if(tail == rank_ + 1)
        tail = 1;
    end 

% Empty?

    if(usT1 == 0 && usT2 == 0)
        isEmpty = 1;  
    end
end
end
end
