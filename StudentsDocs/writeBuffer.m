function writeBuffer(dataElem)

global head 
global tail 
global buffer 
global isFull
global isEmpty
global rango

isEmpty = 0;

% Magnet?

if(dataElem.m(1) == 0 && dataElem.m(2) == 0)
    isMagnet = 0;
    else
    isMagnet = 1;
end

if(isFull == 1)
    disp('The buffe is Full');
else
    
% write data into the buffer
    buffer.x(:,head) = dataElem.x;
    buffer.p(:,head) = dataElem.p;
    buffer.y(:,head) = dataElem.y;
    buffer.u(:,head) = dataElem.u;
    buffer.t(:,head) = dataElem.t;
    buffer.m(:,head) = dataElem.m;
    
% if there is not a magnet, we do not increase head
    if(isMagnet == 1)
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
end
