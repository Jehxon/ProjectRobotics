clear all

global head 
global tail1
global tail2
global buffer 
global isFull 
global isEmpty
global rank_
global usT1
global usT2

head = 1;
tail1 = 1;
tail2 = 1;
buffer = [];
rank_ = 5;
isFull = 0;
isEmpty = 0; 
usT1 = 0;
usT2 = 0;

a = [];

data.x = [1;1;1];
data.p = [2;2;2;2;2;2];
data.y = [3;3];
data.u = [4;4];
data.t = [5];
data.m = [6;6];

% i = [1;2;3;4;5;2;3;4;5;3;4;5;2;3;4;5];
% for i=1:1:4
writeBuffer(data,1);

data.x = [2;2;2];
data.p = [3;3;3;3;3;3];
data.y = [4;4];
data.u = [5;5];
data.t = [6];
data.m = [7;7];


writeBuffer(data,1);



a = readBuffer();
b= [];
b = readBuffer();


 
% writeBuffer(5);


% a(5) = readBuffer();
% writeBuffer(13);



buffer
a
b

