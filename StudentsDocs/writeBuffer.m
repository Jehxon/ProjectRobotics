function writeBuffer(dataElem,isNewMagnet)

global head 
global tail1
global tail2
global buffer 
global isFull
global isEmpty
global rank_
global usT1
global usT2

isEmpty = 0;
usT1 = 0;
usT2 = 0;

% Magnet?

if(dataElem.m(1) == 0 && dataElem.m(2) == 0)
    isMagnet = 0;
    else
    isMagnet = 1;
end

% when we encounter a new magnet, we switch between tail1 and tail2

if(isNewMagnet == 1) 
    if(usT1 < usT2 || usT1 == usT2)
    tail1 = head;
    usT1 = usT1 + 1;
    else 
        tail2 = head;
        usT2 = usT2 + 1; 
    end
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
    
        if(head == rank_ + 1)
            head = 1;
        end  

    % Full? 
    
    if(usT1 < usT2)
        if(head == tail1)
            isFull = 1;
        end
    else
        if(head == tail2)
            isFull = 1;
        end
    end
    end
end
end
