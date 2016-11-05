function [] = HoughLine( P,f )
close all
I = imread(P);
I=rgb2gray(I);
E = edge(I,'canny');
subplot(2,2,1),imshow(I);
title('Image');
subplot(2,2,2), imshow(E);
title('Edge Detection');
[iHeight,iWidth] = size(E);
distMax = round(sqrt(iHeight^2 + iWidth^2)); % Maximum possible distance from origin
theta = -90:1:89; % range of theta values
rho = -distMax:1:distMax; % range of rho values
H = zeros(length(rho),length(theta)); % Allocate accumulator array
% Scan through edge image
for ix=1:iWidth
for iy=1:iHeight
if E(iy,ix) ~= 0
% Fill in accumulator array
for iTheta = 1:length(theta)
t = theta(iTheta)*pi/180; % get angle in radians
% Calculate distance from origin, given this angle
dist = ix*cos(t) + iy*sin(t);
% Find rho value that is closest to this
[d, iRho] = min(abs(rho-dist));
if d <= 1
H(iRho,iTheta) = H(iRho,iTheta) + 1; % Inc accumulator array
end
end
end
end
end
subplot(2,2,3),imshow(H,[]);
title('Hough Transform');
thresh=max(max(H));
thresh=thresh*f;
[iRhoPeaks,iThetaPeaks] = find( H > thresh);
subplot(2,2,4),imshow(E);
title('Detected Lines');
hold on
for i=1:length(iRhoPeaks)
r = rho(iRhoPeaks(i));
t = theta(iThetaPeaks(i)) *pi/180;

DrawLine(r,t,iWidth,iHeight);
end
clear all

end

