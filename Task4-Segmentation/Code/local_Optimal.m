function [ IO ] = local_Optimal( I )
I=(imread('Veg1.jpg'));
IR=I(:,:,1);
X=30;
[M N O]=size(I);
IROptimal=zeros(M,N);
for i=1:X
    for j=1:X
        jLR=round((i-1)*N/X)+1;
        jHR=round(i*N/X);
        iLR=round((j-1)*M/X)+1;
        iHR=round(j*M/X);
        
        if(iHR<M && jHR<N)
        ILR=IR(iLR:iHR,jLR:jHR);
        IRO=Optimal_Thresh(ILR,10);
        IROptimal(iLR:iHR,jLR:jHR)=IRO;
        end
    end
end
IG=I(:,:,2);
IGOptimal=zeros(M,N);
for i=1:X
    for j=1:X
        jLG=((i-1)*N/X)+1;
        jHG=(i*N/X);
        iLG=((j-1)*M/X)+1;
        iHG=(j*M/X);
        
        if(iHG<M && jHG<N && iLR>0 && jLR>0)
        ILG=IG(iLG:iHG,jLG:jHG);
        IGO=Optimal_Thresh(ILG,10);
        IGOptimal(iLG:iHG,jLG:jHG)=IGO;
        end
    end
end
IB=I(:,:,3);
IBOptimal=zeros(M,N);
for i=1:X
    for j=1:X
        jLB=((i-1)*N/X)+1;
        jHB=(i*N/X);
        iLB=((j-1)*M/X)+1;
        iHB=(j*M/X);
        
        if(iHB<M && jHB<N)
        ILB=IB(iLB:iHB,jLB:jHB);
        IBO=Optimal_Thresh(ILB,10);
        IBOptimal(iLB:iHB,jLB:jHB)=IBO;
        end
    end
end
IOptimal_new=zeros(size(I,1),size(I,2),size(I,3));
IOptimal_new(:,:,1)=IROptimal;
IOptimal_new(:,:,2)=IGOptimal;
IOptimal_new(:,:,3)=IBOptimal;
subplot(2,1,1); imshow(IOptimal_new,[])

I1=(imread('MRI.jpg'));
S=size(I1);
if length(S)==3
    I1=rgb2gray(I1);
end
[P Q]=size(I1);
IOptimal=zeros(P,Q);
for i=1:X
    for j=1:X
        jL=round((i-1)*P/X)+1;
        jH=round(i*P/X);
        iL=round((j-1)*Q/X)+1;
        iH=round(j*Q/X);
        
        if(iH<P && jH<Q)
        IL=I1(iL:iH,jL:jH);
        IO=Optimal_Thresh(IL,10);
        IOptimal(iL:iH,jL:jH)=IO;
        end
    end
end
subplot(2,1,2); imshow(IOptimal,[])
end


