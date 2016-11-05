function [] = HoughCircle(P,t);
close all
I = rgb2gray(imread(P));
[N,M] = size(I);
[E] = edge(I, 'canny', 0.2);
R=sqrt(((M)^2)+((N)^2));
RMax=round(R+1);
% Fill accumulator array A(N,M,R)
A = zeros(N,M,RMax);
[yIndex xIndex] = find(E); % get edge points
for cnt = 1:length(xIndex)
for y0=1:N
for x0 = 1:M
r = sqrt(((xIndex(cnt)-x0)^2)+((yIndex(cnt)-y0)^2));
r = round(r);
if (r < R & r >= 1)
A(y0,x0,r) = A(y0,x0,r)+1;
end
end
end
end
subplot(2,2,1),imshow(I);
title('Image');
subplot(2,2,2),imshow(E);
title('Edge Detection');
f=t;
subplot(2,2,3),imshow(A(:,:,round(R/2)),[]);
title('Hough Transform');
nseg=100;
S='r';
thresh=max(max(max(A)));
thresh=f*thresh;
thresh=round(thresh);
subplot(2,2,4),imshow(E);
title('Circles Detected');

for i=1:RMax
[s d]=find(A(:,:,i)>thresh);
if(s~=0)
for n=1:length(s)
yd=s(n);
xd=d(n);
rd=i;
hold on
DrawCircle(xd, yd, rd,nseg,'r')
end
end
end
clear all
end

