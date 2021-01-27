function writeBuffer(dataElem)

global head 
global tail 
global buffer 
global isFull
global isEmpty
global rango

isEmpty = 0;

% Magnet?

m = dataElem(15:16,:);
if(m(1) == 0 && m(2) == 0)
    isMagnet = 0;
else
    isMagnet = 1;
end


if(isFull == 1)
    disp('The buffe is Full');
else
    
% write data into the buffer
    buffer(:,head) = dataElem;
    
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
