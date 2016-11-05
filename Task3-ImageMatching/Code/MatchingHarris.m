function [ result ] = MatchingHarris( I1,thresh1,Scale1, I2,thresh2, Scale2, SSDthresh )
%close all;
%Image 1 Get features and time then get SIFT and Time
t1=clock;
[EFRow EFCol Itheta IMag I]=GetFeaturesHarris(I1,thresh1, Scale1);
t2=clock;
m1=t1(5);
m2=t2(5);
s1=t1(6);
s2=t2(6);

Fmin1=0;
Fsec1=0;
if m1~=m2
    Fmin1=m2-m1;
end
if s1~=s2
    Fsec1=s2-s1;
end
t1=clock;
[ DesI1 ] = SIFTDescriptor( EFRow,EFCol,Itheta,IMag,I);
t2=clock;
m1=t1(5);
m2=t2(5);
s1=t1(6);
s2=t2(6);

SIFTmin=0;
SIFTsec=0;
if m1~=m2
    SIFTmin=m2-m1;
end
if s1~=s2
    SIFTsec=s2-s1;
end
%Show Feature points on Image
subplot(1,2,2),imshow(I,[]);title({['The time to get SIFT descriptor for ',num2str(length(EFRow)),' feature points is ',num2str(SIFTmin),' mins ',num2str(SIFTsec),' secs'];['Detecting features using Harris Operator took ',num2str(Fmin1),' mins ',num2str(Fsec1),' secs'];[' ']})
hold on
plot(EFCol,EFRow,'rs');

%Image 2 Get Features and Time then Get SIFT and Time
t1=clock;
[EFRow EFCol Itheta IMag I]=GetFeaturesHarris(I2,thresh2, Scale2);
t2=clock;
m1=t1(5);
m2=t2(5);
s1=t1(6);
s2=t2(6);
Fmin=0;
Fsec=0;
if m1~=m2
    Fmin=m2-m1;
end
if s1~=s2
    Fsec=s2-s1;
end
t1=clock;
[ DesI2 ] = SIFTDescriptor( EFRow,EFCol,Itheta,IMag,I);
t2=clock;
m1=t1(5);
m2=t2(5);
s1=t1(6);
s2=t2(6);

if m1~=m2
    SIFTmin=m2-m1;
end
if s1~=s2
    SIFTsec=s2-s1;
end
t1=clock;
[L1 NDes1]=size(DesI1);
[L2 NDes2]=size(DesI2);
SSDmin=zeros(1,NDes1);
for i=1:NDes1
    SSDV=zeros(1,NDes2);
    for j=1:NDes2
       SSDVals=DesI1(:,i)-DesI2(:,j);
       SSDVal=times(SSDVals,SSDVals); 
       SSDV(j)=sum(SSDVal);
    end
    
    SSDmin(i)=min(min(SSDV));
end

MINS=find(SSDmin<SSDthresh);
NMatching=length(MINS);
ratio= NMatching/NDes1;
result =' Not Matching';
if ratio >=0.7
    result = ' Matching';
end
t2=clock;
m1=t1(5);
m2=t2(5);
s1=t1(6);
s2=t2(6);
Matchmin=0;
Matchsec=0;

if m1~=m2
    Matchmin=m2-m1;
end
if s1~=s2
    Matchsec=s2-s1;
end

subplot(1,2,1),imshow(I,[]);
title({['The time to get SIFT descriptor for ',num2str(length(EFRow)),' feature points is ',num2str(SIFTmin),' mins ',num2str(SIFTsec),' secs'];['Detecting features using Harris Operator took ',num2str(Fmin),' mins ',num2str(Fsec),' secs'];['                                                                                                                                       Result = ',result,' //// Matching Time = ',num2str(Matchmin),' mins ',num2str(Matchsec),' secs']})
hold on
plot(EFCol,EFRow,'rs');

end

