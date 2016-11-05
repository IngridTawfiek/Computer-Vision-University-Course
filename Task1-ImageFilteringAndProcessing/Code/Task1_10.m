[image1,LPFImage,filter1]=LPGF('freak_grey.jpg',30);
[image2,HPFImage,filter2]=Laplacian('lion_grey.jpg');
%[HPFImage]=Laplacian('lion_grey.jpg');
LPFI=imresize(image1,[600 265]);
HPFI=imresize(image2,[600 265]);
%LPFI=double(LPFI);    
%HPFI=double(HPFI);
HybridImage=LPFI+HPFI;
subplot(1,3,1);imshow(LPFI,[]);
subplot(1,3,2);imshow(HPFI,[]);
subplot(1,3,3);imshow(HybridImage,[]);


