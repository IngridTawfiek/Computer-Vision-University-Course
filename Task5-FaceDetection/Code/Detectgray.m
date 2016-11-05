function[Im]= Detectgray(Imj,FW,FL) %WW face width WL face length
close all
Is11=imread('Skin\1.jpg');
Is12=imread('Skin\2.jpg');
Is13=imread('Skin\3.jpg');
Is14=imread('Skin\4.jpg');
Is15=imread('Skin\5.jpg');
Is16=imread('Skin\6.jpg');
Is11=rgb2gray(Is11);
Is12=rgb2gray(Is12);
Is13=rgb2gray(Is13);
Is14=rgb2gray(Is14);
Is15=rgb2gray(Is15);
Is16=rgb2gray(Is16);

Is(1,1:10,1:10)=(Is11(1:10,1:10));
Is(2,1:10,1:10)=(Is12(1:10,1:10));
Is(3,1:10,1:10)=(Is13(1:10,1:10));
Is(4,1:10,1:10)=(Is14(1:10,1:10));
Is(5,1:10,1:10)=(Is15(1:10,1:10)); 
Is(6,1:10,1:10)=(Is16(1:10,1:10));

Is=Is(:);
L=length(Is);
IT(1:L,1)=Is;

IG(1:L)=ones;    %one skin


Ins15=imread('NSkin\99.jpg');
Ins15=rgb2gray(Ins15);

Ins(1,1:80,1:80)=(Ins15(1:80,1:80));


Ins=Ins(:);
LN=length(Ins);
IT(L+1:L+LN,1)=Ins;

IG(L+1:L+LN)=zeros;  %zeros nonskin

Im=imread(Imj); %Sample image
Im=rgb2gray(Im);

[L W H]=size(Im);
IM=Im(:);
LS=length(IM);
IS(1:LS,1)=IM;


Class=knnclassify(IS,IT,IG);

Class =reshape(Class,L,W);
 WW=FW; %half length (X) 
 WL=FL; %half width (Y)
Win=ones(2*WL,2*WW);
ImWin=zeros(2*WL,2*WW);
ClassN=zeros(L,W);
ClassNN = padarray(Class,[WL WW]);

for i=WL+1:L+WL
    for j=WW+1:W+WW
         ImWin=ClassNN(i+1-WL:i+WL,j+1-WW:j+WW).*Win;
         ClassN(i-WL,j-WW)=sum(sum(ImWin));
         
    end
end
ClassR=imregionalmax(ClassN);
ClassR=ClassN.*ClassR;
[Y X]=find(ClassR>=WW*WL*2.8);
X=X-WW;
Y=Y-WL;
imshow(Im);
hold on
for i=1:length(X)
    rectangle('Position',[X(i),Y(i),WW*2,WL*2])
end
end