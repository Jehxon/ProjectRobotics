function data = readBuffer()

global head 
global tail 
global y 
global rango
global isFull
global isEmpty

isFull = 0;

if(isEmpty == 1)
    disp ('The buffer is empty');
else
    
% Read data from the buffer
    data = y(tail);
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