function [ Im ] = agglomerative( Imj)
clear all
close all
Imj='0019hv3.bmp';
I=(imread(Imj));
S=size(I);
if length(S)==3
    I=rgb2gray(I);
end
subplot(2,2,1);imshow(I)
Ih=imhist(I);
[M N]=size(I);
[pks locs] = findpeaks(Ih,'minpeakheight',100);
subplot(2,2,3);imhist(I)
hold on
plot(locs,pks,'rs')
for i=1:30
for p=1:length(locs)
    V=locs(p);
    locs(p)=locs(p)+255;
    [val ind]=min(abs(locs-V));
    if val<=35
    locs(ind)=0;
    %locs(p)=round((V+locs(ind))/2);
    locs(p)=V;
    else
        locs(p)=V;
    end
end
end
ind=find(locs~=0);
for k=1:length(ind)
    thresh(k)=locs(ind(k));
end
subplot(2,2,4);imhist(I)
hold on
plot(thresh,100,'rs')
for i=1:M
    for j=1:N;
        for k=2:length(thresh)-1
        if(I(i,j)>=thresh(k-1)&&I(i,j)<=thresh(k))
            Im(i,j)=k *255/(length(thresh)+1);
        end
        end
        if(I(i,j)>max(thresh))
            Im(i,j)=255;
        end
        
        if(I(i,j)<min(thresh))
            Im(i,j)=0;
        end
    end
end
subplot(2,2,2); imshow(Im,[])
colormap(jet)
   