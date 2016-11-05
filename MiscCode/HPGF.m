function [image,output_image,filter ] = HPGF(IM, D0)
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
filter=1-(exp(-((D).^2./(2*D0.^2))));     
 %apply the filter to the image fft 
Imagefftshift=fftshift(imagefft);
output_image= Imagefftshift.* filter;
output_image=ifft2(fftshift(output_image));
output_image=(real(output_image));
end

