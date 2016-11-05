close all;
G=imread('girlWithCoat.tif') ; % to read the grayscale image
subplot(2,4,2);
imshow(G);
title('original image2(1)');
subplot(2,4,5);
imhist(G);
title('Histogram2(1)');
eg = histeq(G);
subplot (2,4,3);
imshow(eg);
title('Equalized image2(2)');
subplot (2,4,7);
imhist(eg);
hg = imhist(G);
title('Hisogrqam2(2)')
chg = cumsum(h);%cumulative histogram
maxchg=max(chg);
chg=chg/maxchg;
subplot(2,4,6);
plot (chg);
title('Distribution curve2(1)');
heg = imhist(eg);
cheg = cumsum(heg);%cumulative histogram
maxcheg=max(cheg);
cheg=cheg/maxcheg;
subplot(2,4,8);
plot (cheg);
title('Distribution curve2(2)');

