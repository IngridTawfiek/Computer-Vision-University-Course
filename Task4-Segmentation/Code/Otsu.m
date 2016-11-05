function [ IOtsu ] = Otsu( I)
%I=(imread(Imj));
%S=size(I);
%if length(S)==3
%    I=rgb2gray(I);
%end
%I=double(I);
%calculate Histogram
IH=imhist(I);
IHm=sum(IH);
IH=IH./IHm;
%w :Class prob. //Mue : Class mean.//t:color
%Var=zeros(256);
for t=0:255;
w1=0;
Mue1=0;
for i=0:t
w1=w1+IH(i+1);
Mue1 =Mue1 + (IH(i+1)*i);
end
Mue1=Mue1/w1;
w2=1-w1;
Mue2=0;
%i:color
for i=t+1:255;
Mue2 =Mue2 + IH(i+1)*i;
end
Mue2=Mue2/w2;
%Var: Var between 2 classes
Var(t+1)=w1*w2*(Mue1-Mue2)^2;
end
[Value index]=max(Var);
thresh=index;
[M N]=size(I);
for i=1:M
    for j=1:N
 if(I(i,j)>=thresh)
            IOtsu(i,j)=255;
        else
            IOtsu(i,j)=0;
 end
    end
end
end