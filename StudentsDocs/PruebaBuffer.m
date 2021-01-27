clear all

global head 
global tail 
global buffer 
global isFull 
global isEmpty
global rango

head = 1;
tail = 1;
buffer = [];
rango = 5;
isFull = 0;
isEmpty = 0; 
a = [];

i = [1;2;3;4;5;2;3;4;5;3;4;5;2;3;4;5];
% for i=1:1:4
writeBuffer(i);
writeBuffer(i+1);

% end
% 
% for i=1:1:3
for f = 1 : head-tail
 a(:,f) = readBuffer();
end
% end
% 
% writeBuffer(5);
% a(4) = readBuffer();
% a(5) = readBuffer();
% writeBuffer(13);



buffer
a
