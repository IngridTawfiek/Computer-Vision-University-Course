 I= rgb2gray(imread('lion_grey.jpg'));
GTV=graythresh(I)*255;
[m n]=size(I);
N=zeros(m,n);
M=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        
        LTV=(I(i-1,j-1)+I(i-1,j)+I(i-1,j+1)+I(i,j-1)+I(i,j)+I(i,j+1)+I(i+1,j-1)+I(i+1,j)+I(i+1,j+1))/9;
        
        if(I(i,j)>=LTV)
            N(i,j)=255;
        else
            N(i,j)=0;
        end
        if(I(i,j)>=GTV)
            M(i,j)=255;
        else
            M(i,j)=0;
        end
        
        
    end
end
subplot(1,2,1);imshow(M);title('Global Thresholding')
subplot(1,2,2);imshow(N);title('Local Thresholding')