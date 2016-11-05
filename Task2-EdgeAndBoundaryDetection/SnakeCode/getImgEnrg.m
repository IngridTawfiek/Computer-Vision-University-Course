%% INFO
%
% getImgEnrg
% Function that calculates the image energy.
%
% Arguments: img - The input image for which the energy should
% be calculated.
% sigma - The sigma value used in the Gauss filter.
%
% Output: enrgImg - The image energy function.
%
% Author: Nikolas Petteri Tiilikainen
% Department of Computer Science
% University of Copenhagen (DIKU)
% 2007
%%
function [enrgImg] = getImgEnrg(img, sigma)
% Build Gauss filter
fSize = [ceil(3*sigma) ceil(3*sigma)];
gf = fspecial('gaussian', fSize, sigma);
% Apply Gauss filter to image
gaussImg = double(imfilter(img, gf, 'replicate'));
% Find gradients using a Sobel filter
fy = fspecial('sobel');
fx = fy;
Iy = imfilter(gaussImg, fy, 'replicate');
Ix = imfilter(gaussImg, fx, 'replicate');
enrgImg = sqrt(Ix.^2 + Iy.^2);
end