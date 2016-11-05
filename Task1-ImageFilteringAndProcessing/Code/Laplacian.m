function [image,output_image,filter ] = Laplacian(IM)
image=rgb2gray(imread(IM));
imagefft=fft2(image); 
%Gaussian filter
[m n]=size(image);
filter=zeros(m,n);
 D=zeros(m,n);
for i=1:m
    for j=1:n
        D(i,j)=sqrt(((i-(m/2))^2)+((j-(n/2))^2));
    end
end
%low pass filters
filter=fspecial('laplacian');    
output_image = imfilter(image,filter,'replicate');
end

