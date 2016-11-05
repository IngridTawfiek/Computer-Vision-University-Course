function[Im]= pixel(Imj,FW,FL) %WW face width WL face length
close all
Is11=imread('Skin\1.jpg');
Is12=imread('Skin\2.jpg');
Is13=imread('Skin\3.jpg');
Is14=imread('Skin\4.jpg');
Is15=imread('Skin\5.jpg');
Is16=imread('Skin\6.jpg');

Is(1,1:10,1:10,1:2)=(Is11(1:10,1:10,1:2));
Is(2,1:10,1:10,1:2)=(Is12(1:10,1:10,1:2));
Is(3,1:10,1:10,1:2)=(Is13(1:10,1:10,1:2));
Is(4,1:10,1:10,1:2)=(Is14(1:10,1:10,1:2));
Is(5,1:10,1:10,1:2)=(Is15(1:10,1:10,1:2)); 
Is(6,1:10,1:10,1:2)=(Is16(1:10,1:10,1:2));

Isr=Is(:,:,:,1);
Isr=Isr(:);
Isg=Is(:,:,:,2);
Isg=Isg(:);
L=length(Isg);
IT(1:L,1)=Isr;
IT(1:L,2)=Isg;

IG(1:L)=ones;    %one skin


Ins15=imread('NSkin\99.jpg');


Ins(1,1:80,1:80,1:2)=(Ins15(1:80,1:80,1:2));


Insr=Ins(:,:,:,1);
Insr=Insr(:);
Insg=Ins(:,:,:,2);
Insg=Insg(:);
LN=length(Insg);
IT(L+1:L+LN,1)=Insr;
IT(L+1:L+LN,2)=Insg;

IG(L+1:L+LN)=zeros;  %zeros nonskin

Im=imread(Imj); %Sample image
[L W H]=size(Im);
Imr=Im(:,:,1);
Imr=Imr(:);
Img=Im(:,:,2);
Img=Img(:);

LS=length(Img);
IS(1:LS,1)=Imr;
IS(1:LS,2)=Img;

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
[Y X]=find(ClassR>=WW*WL*2.2);
X=X-WW;
Y=Y-WL;
imshow(Im);
hold on
for i=1:length(X)
    rectangle('Position',[X(i),Y(i),WW*2,WL*2])
end
size(IS)
size(IT)
size(IG)

end