[image,output_image,filter]=LPBF('lion_grey.jpg',1  ,10);
subplot(1,3,3);imshow(output_image,[]);title('Filtered Image');
subplot(1,3,1);imshow(image);title('Image');
subplot(1,3,2);surf(filter);title('Filter');






