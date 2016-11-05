function [ Im ] =MeanShift( I)
clear all
I=imread('RevolutionJan25.jpg') ; % to read the coloured image

[M N X]=size(I);
RGBHist=ones(17,17,17);

IRe=I(:,:,1);
IGe=I(:,:,2);
IBe=I(:,:,3);
for i=1:M
    for j=1:N
        
        Red=floor(IRe(i,j)/16)+1;
        Gre=floor(IGe(i,j)/16)+1;
        Blu=floor(IBe(i,j)/16)+1;
        RGBHist(Red,Gre,Blu)=RGBHist(Red,Gre,Blu)+1;
        
    end
end

%Sum=sum(sum(sum(RGBHist)));
%RGBHist=RGBHist/Sum;
n=6;
f=1;

for i=1:n  %n:number of clusters
    V=1;
while (V==1)
R(i)= round((rand()*5)+6);
G(i)= round((rand()*5)+6);
B(i)= round((rand()*5)+6);
V=RGBHist(R(i),G(i),B(i));
end
end

%for j=1:2
while(f)
    RB=R;
    BB=B;
    GB=G;

for i=1:n  %n:number of clusters
Window=RGBHist(R(i)-5:R(i)+5,G(i)-5:G(i)+5,B(i)-5:B(i)+5);
RA=(R(i)-5:R(i)+5);
GA=(G(i)-5:G(i)+5);
BA=(B(i)-5:B(i)+5);
%BA=double(BA);
%GA=double(GA);
%RA=double(RA);

ArraB=sum(sum(Window,1),2);
ArrayB=reshape(ArraB,size(BA));
ArraG=sum(sum(Window,1),3);
ArrayG=reshape(ArraG,size(GA));
ArraR=sum(sum(Window,2),3);
ArrayR=reshape(ArraR,size(RA));
BA=times(ArrayB,BA);
BA=BA/sum(ArrayB);
BV=round(sum(BA));
if(BV>=6&&BV<=11)
B(i)=BV;
end
GA=times(ArrayG,GA);
GA=GA/sum(ArrayG);
GV=round(sum(GA));
if(GV>=6&&GV<=11)
G(i)=GV;
end
RA=times(ArrayR,RA);
RA=RA/sum(ArrayR);
RV=round(sum(RA));
if(RV>=6&&RV<=11)
R(i)=RV;
end
end
dR=R-RB;
dG=G-GB;
dB=B-BB;
SUM=sum(dR)+sum(dG)+sum(dB);
if(SUM==0)
    f=0;
end

end

dist=zeros(n,M,N);
IMJ=zeros(M,N);
for l=1:M
for m=1:N
for i=1:n
    r=(R(i)-IRe(l,m))^2;
    g=(G(i)-IGe(l,m))^2;
    b=(B(i)-IBe(l,m))^2;
    dist(i,l,m)=r+g+b;
end 
 [Val Ind]=min(dist(:,l,m));
IMJ(l,m)=Ind;
end    
end
IMJ=IMJ*255/n;
imshow(IMJ,[])
colormap(jet)
end