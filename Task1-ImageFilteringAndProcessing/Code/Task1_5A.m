%histogram
close all;
I=imread('girlWithScarf.png') ; % to read the grayscale image
I = rgb2gray(I);
subplot(2,4,2);
imshow(I);
title('original image1(1)');
subplot(2,4,5);
imhist(I);
title('Histogram1(1)');
e = histeq(I);
subplot (2,4,3);
imshow(e);
title('Equalized image1(2)');
subplot (2,4,7);
imhist(e);
h = imhist(I);
title('Hisogrqam1(2)')
ch = cumsum(h);%cumulative histogram
maxch=max(ch);
ch=ch/maxch;
subplot(2,4,6);
plot (ch);
title('Distribution curve2(1)');
he = imhist(e);
che = cumsum(he);%cumulative histogram
maxche=max(che);
che=che/maxche;
subplot(2,4,8);
plot (che);
title('Distribution curve1(2)');




