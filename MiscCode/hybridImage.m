% Make hybrid image:

im1 = imread('/Users/pless/Desktop/bird.JPG');
im2 = imread('/Users/pless/Desktop/flickr1.jpg');

%% preprocess im1
% change it to B+W
imp1 = double(rgb2gray(im1));

% below is lightweight image cropping and re-scaling.  you could also do this in
% photoshop or powerpoint or macpaint or whatever.
imp1 = imp1(600:end,:);  % cut off top 600 lines, keep all columns.
imp1 = fliplr(imp1);     % flip the image l/r
imp1 = imresize(imp1,[600 800]);  % resize it to 600 x 800

%% preprocess im2
imp2 = double(rgb2gray(im2));
imp2 = imresize(imp2,[600 800]);

% make blurry versions of both images
blurryimp1 = imfilter(imp1,fspecial('gaussian',[51 51], 8));
blurryimp2 = imfilter(imp2,fspecial('gaussian',[51 51], 8));

%% add them together and show them.
imagesc(blurryimp1 + blurryimp2);

% note, the above is NOT the answer to the project, this code is just intended 
% to offer an introduction to (but making one hybrid
% image may not take many changes/additions.)
