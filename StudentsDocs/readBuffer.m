function data = readBuffer()

global head 
global tail %necesitamos dos tails y un solo head, pero cuando tenemos dos imanes y cogemos una medida, hace falta llevar tail 1 con head hasta que vuelva a medir
global buffer 
global rango
global isFull
global isEmpty

isFull = 0;

if(isEmpty == 1)
    disp ('The buffer is empty');
else
    
% Read data from the buffer
    data.x = buffer.x(:,tail);
    data.p = buffer.p(:,tail);
    data.y = buffer.y(:,tail);
    data.u = buffer.u(:,tail);
    data.t = buffer.t(:,tail);
    data.m = buffer.m(:,tail);
    
    
    tail = tail + 1;

% If we arrive to the end -> reset index
    if(tail == rango + 1)
        tail = 1;
    end 
    
% Empty?
    if(head == tail && isFull == 0)
        isEmpty = 1;
        disp('The buffer is empty');
    end
    
end
end