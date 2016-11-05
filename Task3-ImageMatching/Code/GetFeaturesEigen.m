function [ EFRow,EFCol,Itheta,IMag,I] = GetFeaturesEigen( Im,thresh,Scale )
I=(imread(Im));
S=size(I);
if length(S)==3
    I=rgb2gray(I);
end
I=double(I);
I=imresize(I,Scale);
%Image Gradient
Sobelx=[1 -2 1];
Sobely=[1;-2;1];
Ix=conv2(I,Sobelx,'same');
Iy=conv2(I,Sobely,'same');
Ix2=times(Ix,Ix);
Ixy=times(Ix,Iy);
Iy2=times(Iy,Iy);

%Filter Gradients
gaussian = fspecial('gaussian');
IX2=imfilter(Ix2,gaussian);
IY2=imfilter(Iy2,gaussian);
IXY=imfilter(Ixy,gaussian);

%Get Feature Points Using Harris operator and Eigen Values 
[L W]=size(I);
Itheta=atan2(Iy,Ix);  %Calculate Theta
IMag=zeros(L,W);
Eigen=zeros(L,W,2);
for i=1:L;
    for j=1:W;
        IMag(i,j)=sqrt(Iy2(i,j)+Ix2(i,j));    %Calculate Mag.
        H(1,1)=IX2(i,j);
        H(1,2)=IXY(i,j);
        H(2,1)=IXY(i,j);
        H(2,2)=IY2(i,j);
        
        EIG=eig(H);
        Eigen(i,j,1)=max(EIG);
        Eigen(i,j,2)=min(EIG);
        
    end
end


Ethresh=thresh*max(max(Eigen(:,:,2)));
%Local Maxima
EMax=imregionalmax(Eigen(:,:,2));
Eigen(:,:,2)=times(Eigen(:,:,2),EMax);

% Get highest 500 feature point (thresholding)
[EFRow EFCol]=find(Eigen(:,:,2)>Ethresh);


end

