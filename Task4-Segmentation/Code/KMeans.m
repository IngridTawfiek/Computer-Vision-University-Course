  close all
  clear all
Im='0019hv3.bmp';
I=(imread(Im));
S=size(I);
if length(S)==3
    I=rgb2gray(I);
end
I=double(I);
%Say we have n clusters
[M N]=size(I);
n=4;
%Mue=zeros(n);
for k=1:n
    Mue(k)= rand()*255;
    C=zeros(k,M,N);
end

%n matrices each matrix contain indexes in the cluster
f=0;
while (f==0)
    f=1;
%for z=1:10
for i=1:M
    for j=1:N
        
        for k=1:n
            C(k,i,j)=abs(Mue(k)-I(i,j));
        end
        
      [Val Kmin]=min(C(:,i,j));
      for k=1:n
          if k== Kmin
             C(k,i,j)=1;
          else
              C(k,i,j)=0;
          end
      end
        
    end
end
Im=zeros(M,N);
Ix=reshape(I,1,M,N);
for k=1:n
    Im=times(C(k,:,:),Ix);
    MUE=sum(Im(:));
    [V]=find(Im~=0);
    
    MUE =MUE/length(V);
    
if((Mue(k)-MUE)>=10)
    f=0;
end
Mue(k)=MUE;
end

end
IMAGE=reshape(Im,M,N);
for k=1:n
    C(k,:,:)=C(k,:,:)*k *255/n;
end
H=sum(C);
H=reshape(H,M,N);
imshow(H,[])
colormap(jet)








