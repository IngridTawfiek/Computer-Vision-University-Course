function [ Inew ] = Optimal_RGB( I )
%for colored image
I=imread('Veg1.jpg');
figure;
subplot(2,2,1); imshow(I)
n=10;
IR=I(:,:,1);
IRO=Optimal_Thresh( IR,n);
% IR1=IRO.*255;
IG=I(:,:,2);
IGO=Optimal_Thresh( IG,n);
% IG1=IGO.*255;
IB=I(:,:,3);
IBO=Optimal_Thresh( IB,n);
% IB1=IBO.*255;
Inew=zeros(size(I,1),size(I,2),size(I,3));
Inew(:,:,1)=IRO;
Inew(:,:,2)=IGO;
Inew(:,:,3)=IBO;
subplot(2,2,2); imshow(Inew,[])

%for grayscale image
Imj=imread('MRI.jpg');
subplot(2,2,3); imshow(Imj)
S=size(Imj);
if length(S)==3
   I=rgb2gray(Imj);
end
IO=Optimal_Thresh( I,n);
subplot(2,2,4); imshow(IO)
end
