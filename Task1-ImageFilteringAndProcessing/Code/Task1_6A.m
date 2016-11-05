close all;  
I=imread('girlWithScarf.png') ; % to read the grayscale image
  I = rgb2gray(I);
  I= im2double(I);
Mean = mean(mean(I));
std=std2(I);
[m n]=size(I);
Inorm = zeros(m,n);
for i= 1:m
    for j= 1:n
        Inorm(i,j)=(I(i,j)-Mean)/std;
        if (Inorm(i,j)<0)
            Inorm(i,j) = 0;
        end
        if (Inorm(i,j)>1)
            Inorm(i,j) = 1;
        end
        
        
    end
end
subplot(2,2,2)
imshow(Inorm)
title('Normalized Image1 (3)')
subplot(2,2,4)
imhist(Inorm)
subplot(2,2,1)
imshow(I);
title('Original image1')
subplot(2,2,3)
imhist(Inorm);
title('Histogram1(3)')
hn = imhist(Inorm);
chn = cumsum(hn);%cumulative histogram
maxchn=max(chn);
chn=chn/maxchn;
subplot(2,4,8);
plot (chn);
title('Distribution Curve1(3)');


