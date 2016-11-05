 I=imread('girlWithScarf.png') ; % to read the grayscale image
I = rgb2gray(I);
figure(1);
subplot(2,3,1);
imshow(I);
title('Original Image');


%salt and pepper noise
ISP = imnoise(I,'salt & pepper'); % to create the noisy image
subplot(2,3,3);
imshow(ISP);
title('Salt and Pepper Noisy Image');

% Averaging filter
a = fspecial('average',[3 3]); 
IAF = imfilter(ISP,a);

subplot(2,3,4);
imshow(IAF);title('average filter');

%Gaussian filter
g = fspecial('gaussian', [3 3] , 0.5);
IGF = imfilter(ISP,g);
subplot(2,3,5); 
imshow(IGF);title('Gaussian filter');

% Median filter
m=medfilt2(ISP, [3 3]);
subplot(2,3,6);
imshow(m);title('Median filter');