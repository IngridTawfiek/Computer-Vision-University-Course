function [ ImageDes ] = SIFTDescriptor( EFRow,EFCol,Itheta,IMag,I)
%Get SIFT Descriptor

ImageDes=zeros(128,length(EFRow));
for f=1:length(EFRow)
%feature point location
Row=EFRow(f);
Col=EFCol(f);
[L W]=size(I);
%Take Mask with size N*N centered at Feature point
N=32;
mask(1:N,1:N)=1;
if(Row>(N/2) && Col>(N/2)&& Col<(W-(N/2))&& Row<(L-(N/2)))
thetaMask=times(Itheta(Row-(N/2):Row+(N/2)-1,Col-(N/2):Col+(N/2)-1),mask);
MagMask=times(IMag(Row-(N/2):Row+(N/2)-1,Col-(N/2):Col+(N/2)-1),mask);
ImMask=I(Row-(N/2):Row+(N/2)-1,Col-(N/2):Col+(N/2)-1);

%get Dominant Orientaion of 16*16 Mask
thetaHist=zeros(1,32);
for i=(N/2)-8:(N/2)+7;
    for j=(N/2)-8:(N/2)+7;
        for k =-14:16;
   %Votiong with linear interpolation       
   if(thetaMask(i,j)>=(k-1)*pi/16 && thetaMask(i,j)< k*pi/16)
       Factor= ((k*pi/16)-thetaMask(i,j))*16/pi;
       thetaHist(k+16)=thetaHist(k+16)+IMag(i,j)*(1-Factor);
       thetaHist(k+15)=thetaHist(k+15)+IMag(i,j)*(Factor);
   end
        end
         if(thetaMask(i,j)>-pi && thetaMask(i,j)< -pi*15/16)
       Factor= ((-15*pi/16)-thetaMask(i,j))*16/pi;
       thetaHist(1)=thetaHist(1)+IMag(i,j)*(1-Factor);
       thetaHist(32)=thetaHist(32)+IMag(i,j)*(Factor);
         end
    end
end
[C MaxInd]=max(thetaHist);
domRotation=(MaxInd-16)*pi/16;
domRotation=domRotation*180/pi;

%Rotate Masked Image
IRotated=imrotate(ImMask,-domRotation,'loose');
%Calc Gradient and theta of Masked Image
Sobelx=[1 -2 1];
Sobely=[1;-2;1];
IxR=conv2(IRotated,Sobelx,'same');
IyR=conv2(IRotated,Sobely,'same');
IxR2=times(IxR,IxR);
IyR2=times(IyR,IyR);

[L W]=size(IRotated);
IRtheta=atan2(IyR,IxR);
IRMag=zeros(L,W);

for i=1:L;
    for j=1:W;
        IRMag(i,j)=sqrt(IyR2(i,j)+IxR2(i,j));
        if IRMag(i,j)<max(max(IRMag))*0.01  %throw weak edges
            IRMag(i,j)=0;
        end
        
    end
end
%Filter the Masked image
gaussian = fspecial('gaussian');
IRMag=imfilter(IRMag,gaussian);

%Take 16*16 of rotated Mask centered at the feature point
[F G]=size(IRotated);
F=F/2;
F=round(F);
IMRotated=IRotated(F-8:F+7,F-8:F+7);
IMRtheta=IRtheta(F-8:F+7,F-8:F+7);
IMRMag=IRMag(F-8:F+7,F-8:F+7);

[L W]=size(IMRotated);
%Calc Descriptor
Des=zeros(16,8);
DesRow=zeros(128,1);
      
for i=1:4
    for j=1:4
       IRTHETA=IMRtheta(((i-1)*L/4)+1:i*L/4,((j-1)*W/4)+1:j*W/4);
       IRMAG=IMRMag(((i-1)*L/4)+1:i*L/4,((j-1)*W/4)+1:j*W/4);
       THist=zeros(1,8);
       for x=1:4
           for y=1:4
               T=IRTHETA(x,y);
               M=IRMAG(x,y);
    %Votiong with linear interpolation        
    for k =-2:4
    if(T>=(k-1)*pi/4 && T< k*pi/4)
        Factor= ((k*pi/4)-T)*4/pi;
        THist(k+3)=THist(k+3)+ M*Factor ;
        THist(k+4)=THist(k+4)+M*(1-Factor);
         
    end
    end
    if(T>=-pi && T< -3*pi/4)
        Factor= ((-3*pi/4)-T)*4/pi;
        THist(8)=THist(8)+ M*Factor ;
        THist(1)=THist(1)+M*(1-Factor);
         
    end
    
               
               
           end
       end
       
       %Descriptor
   N=j+(i-1)*4;
   Des(N,:)=THist;
       
       
    end
end

for z=1:16
    
    DesRow((z-1)*8+1:z*8)= Des(z,:);

end
Sum=0;
for n =1 : length(DesRow)
    Sum=Sum+abs(DesRow(n));

end

for n =1 : length(DesRow)
    DesRow(n)=DesRow(n)/Sum;

end
ImageDes(:,f)=DesRow;
end
end


end

