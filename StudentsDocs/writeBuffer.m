function writeBuffer(dataElem)

global head 
global tail 
global y 
global isFull
global isEmpty
global rango

isEmpty = 0;

if(isFull == 1)
    disp('The buffe is Full');
else
    
% write data into the buffer
    y(head) = dataElem;
    head=head+1;
    
% If we arrive to the end -> reset index
    if(head == rango + 1)
        head = 1;
    end  
    
% Full? 
    if(head == tail)
        isFull = 1;
    end
    
end
end
