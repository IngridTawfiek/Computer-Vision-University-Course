close all; 
C=imread('peppers.png') ; % to read the coloured image
figure;
subplot(2,1,1);
imshow(C);
title('Coloured Image');


G = rgb2gray(C);
subplot(2,1,2);
imshow(G);
title('Gray scale Image');

figure;
redPlane = C(:, :, 1);
greenPlane = C(:, :, 2);
bluePlane = C(:, :, 3);

% Let's get its histograms.
subplot(3, 2, 1);
imhist(C(:,:,1)); % first plane: Red
title('Histogram of red plane');
subplot (3,2,2);
hr = imhist(C(:,:,1));
chr = cumsum(hr);%cumulative histogram
plot (chr, 'r');
title('Distribution curve of red plane');

subplot(3, 2, 3);
imhist(C(:,:,2)); % second plane: Green
title('Histogram of green plane');
subplot (3,2,4);
hg = imhist(C(:,:,2));
chg = cumsum(hg);%cumulative histogram
plot (chg, 'g');
title('Distribution curve of green plane');

subplot(3, 2, 5);
imhist(C(:,:,3)); % third plane: Blue
title('Histogram of blue plane');
subplot (3,2,6);
hb = imhist(C(:,:,3));
chb = cumsum(hb);%cumulative histogram
plot (chb, 'b');
title('Distribution curve of blue plane');
