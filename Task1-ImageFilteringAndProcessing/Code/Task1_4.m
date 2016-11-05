%histogram
close all;
I=imread('girlWithScarf.png') ; % to read the grayscale image
I = rgb2gray(I);
subplot (2,3,1);
imshow(I);
title('image1');
subplot(2,3,2);
imhist(I);
title('Histogram1');
h = imhist(I);
ch = cumsum(h);%cumulative histogram
subplot(2,3,3);
plot (ch);
title('Distribution curve1');

G=imread('girlWithCoat.tif') ; % to read the grayscale image
subplot (2,3,4);
imshow(G);
title('image2');
subplot(2,3,5);
imhist(G);
title('Histogram2');
hg = imhist(G);
chg = cumsum(hg);%cumulative histogram
subplot(2,3,6);
plot (chg);
title('Distribution curve2');




