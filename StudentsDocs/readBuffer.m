function data = readBuffer()

global head 
global tail 
global buffer 
global rank_
global isFull
global isEmpty

isFull = 0;

if(isEmpty == 1)
    disp ('The buffer is empty');
else
    

    
% Read data from the buffer
for f = 1 : head-tail
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
        disp('The buffer is empty');
    end
end
    
end
end