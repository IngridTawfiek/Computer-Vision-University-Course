function DrawLine( r,t,iWidth,iHeight )
x=[];
y=[];
for xi=1:iWidth 
    
yi = (-cos(t)*xi+r)/sin(t);

if(yi>0 & yi<iHeight)
y(xi)= yi;
x(xi)= xi;
end

end
plot(x,y,'r','MarkerSize',20);

end

