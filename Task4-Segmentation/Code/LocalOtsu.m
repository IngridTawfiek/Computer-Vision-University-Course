function [ IO ] = local_Otsu( I )
I=(imread('MRI.jpg'));
figure
subplot(1,2,2); imshow(I)
S=size(I);
if length(S)==3
    I=rgb2gray(I);
end
X=40;
[M N]=size(I);
IOtsu=zeros(M,N);
for i=1:X
    for j=1:X
        jL=((i-1)*N/X)+1;
        jH=(i*N/X);
        iL=((j-1)*M/X)+1;
        iH=(j*M/X);
        
        if(iH<M && jH<N)
        IL=I(iL:iH,jL:jH);
        IO=Otsu(IL);
        IOtsu(iL:iH,jL:jH)=IO;
        end
    end
end
imshow(IOtsu,[])
IOtsu_global=Otsu(I);
subplot(1,2,1); imshow(IOtsu_global)
end
