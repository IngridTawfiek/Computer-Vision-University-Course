% Edge detection using sobel
BW1 = edge(I,'sobel');
subplot (2,2,1);
imshow(BW1);title('Sobel edge detector');

% Edge detection using roberts
BW2 = edge(I,'roberts');
subplot (2,2,2);
imshow(BW2);title('roberts edge detector');

% Edge detection using prewitt
BW3 = edge(I,'prewitt');
subplot (2,2,3);
imshow(BW3);title('prewitt edge detector');

% Edge detection using canny
BW4 = edge(I,'canny');
subplot (2,2,4);
imshow(BW4);title('canny edge detector');
