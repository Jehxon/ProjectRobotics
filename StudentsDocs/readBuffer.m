function data = readBuffer()

global head
global tail1
global tail2
global buffer 
global rank_
global isFull
global isEmpty
global usT1
global usT2

isFull = 0;

if(isEmpty == 1)
    disp ('The buffer is empty');
else

% Check which tail we use

if(usT1 < usT2)
    tail = tail2;
    usT2 = usT2 - 1;
else
    tail = tail1;
    usT1 = usT1 - 1;
end


% When head is at the beginning of the buffer and tail at the end,we adjust
% the index t

if(head - tail < 0)
    t = -(rank_ - tail);
else
    t = tail;
end

% Read data from the buffer

for f = 1 : head-t
    data.X(:,f) = buffer.X(:,tail);
    data.P(:,f) = buffer.P(:,tail);
    data.Y(:,f) = buffer.Y(:,tail);
    data.U(:,f) = buffer.U(:,tail);
    data.T(:,f) = buffer.T(:,tail);
    data.M(:,f) = buffer.M(:,tail);


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
