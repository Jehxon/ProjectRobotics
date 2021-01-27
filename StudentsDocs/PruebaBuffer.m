clear all

global head 
global tail 
global y 
global isFull 
global isEmpty
global rango

head = 1;
tail = 1;
y = [];
rango = 5;
isFull = 0;
isEmpty = 0; 
a = [];

for i=1:1:4
writeBuffer(i);
end

for i=1:1:3
a(i) = readBuffer();
end

writeBuffer(5);
a(4) = readBuffer();
a(5) = readBuffer();
writeBuffer(13);

y
a
