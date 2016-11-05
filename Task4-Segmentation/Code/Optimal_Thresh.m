function [ IO ] = Optimal_Thresh( Imj,n)
I=double(Imj);
% Size Of the image
[M N]=size(I);
%Object image    0 background 1 object
SumB = sum([I(1,1), I(1,N), I(M,1), I(M,N)]);
MueB=SumB/4;
SumO =sum(I(:))-sum([I(1,1), I(1,N), I(M,1), I(M,N)]);
MueO = SumO/((size(I,1)*size(I,2))-4);
Mue=(MueO+MueB)/2;

for l=1:n;
SumO=sum(sum(I(find(I<Mue))));
MueO=SumO/length(find(I<Mue));
SumB=sum(sum(I(find(I>=Mue))));
MueB=SumB/length(find(I>=Mue));
Mue=(MueO+MueB)/2;
end
IO=zeros(size(I));
IO(find(I>Mue))=255;
end