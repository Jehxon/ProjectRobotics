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

if(usT1 > usT2)
    tail = tail2;
else
    tail = tail1;
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
    data.x(:,tail) = buffer.x(:,tail);
    data.p(:,tail) = buffer.p(:,tail);
    data.y(:,tail) = buffer.y(:,tail);
    data.u(:,tail) = buffer.u(:,tail);
    data.t(:,tail) = buffer.t(:,tail);
    data.m(:,tail) = buffer.m(:,tail);
    
    
    tail = tail + 1;

% If we arrive to the end -> reset index

    if(tail == rank_ + 1)
        tail = 1;
    end 
    
% Empty?

    if(head == tail && isFull == 0)
        isEmpty = 1;  
    end
end
    
end
end