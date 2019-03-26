function augment(Mode, image_dir, dataset)
orgimg = imread(image_dir);
start = [1 1 128 128];

if(strcmp(dataset, 'train'))

if(Mode==1 || Mode==5) %scale + rotate
    I1 = imcrop(orgimg, start);
    newDir = replace(image_dir,'/train/','/train_aug/');
    newDir2 = replace(newDir,'.png','_org.png')
    imwrite(I1, newDir2);
    
end
if(Mode==2 || Mode==5) %scale + Translate
    rotate = 50;
    tmp = imrotate(orgimg,10,'bilinear','crop');
    I2 = imcrop(tmp, start+rotate);
    newDir = replace(image_dir,'/train/','/train_aug/');
    newDir2 = replace(newDir,'.png','_rotate.png')
    imwrite(I2, newDir2);
end
if(Mode==3 || Mode==5) %scale + reflection
    tmp = imresize(orgimg, 1.5);
    I3 = imcrop(tmp, start);
    newDir = replace(image_dir,'/train/','/train_aug/');
    newDir2 = replace(newDir,'.png','_scale.png')
    imwrite(I3, newDir2);
end
if(Mode==4 || Mode==5) %rotate + reflection
    trans = 10;
    I4 = imcrop(orgimg, start+trans);
    newDir = replace(image_dir,'/train/','/train_aug/');
    newDir2 = replace(newDir,'.png','_trans.png')
    imwrite(I4, newDir2);
end 

if(Mode==5 || Mode==5) %rotate + Translate
    tmp = flip(orgimg);
    I5 = imcrop(tmp, start);
    newDir = replace(image_dir,'/train/','/train_aug/');
    newDir2 = replace(newDir,'.png','_reflect.png')
    imwrite(I5, newDir2);
end 

end

if(strcmp(dataset, 'test'))
    
   if(Mode==1 || Mode==6)
    I1 = imcrop(orgimg, start);
    newDir = replace(image_dir,'/test/','/test_aug/');
    newDir2 = replace(newDir,'.png','_org.png')
    imwrite(I1, newDir2);
    
   end

if(Mode==2 || Mode==6)
    rotate = 50;
    tmp = imrotate(orgimg,10,'bilinear','crop');
    I2 = imcrop(tmp, start+rotate);
    newDir = replace(image_dir,'/test/','/test_aug/');
    newDir2 = replace(newDir,'.png','_rotate.png')
    imwrite(I2, newDir2);
end
if(Mode==3 || Mode==6)
    tmp = imresize(orgimg, 1.5);
    I3 = imcrop(tmp, start);
    newDir = replace(image_dir,'/test/','/test_aug/');
    newDir2 = replace(newDir,'.png','_scale.png')
    imwrite(I3, newDir2);
end
if(Mode==4 || Mode==6)
    trans = 5;
    I4 = imcrop(orgimg, start+trans);
    newDir = replace(image_dir,'/test/','/test_aug/');
    newDir2 = replace(newDir,'.png','_trans.png')
    imwrite(I4, newDir2);
end 

if(Mode==5 || Mode==6)
    tmp = flip(orgimg);
    I5 = imcrop(tmp, start);
    newDir = replace(image_dir,'/test/','/test_aug/');
    newDir2 = replace(newDir,'.png','_reflect.png')
    imwrite(I5, newDir2);
end 

end
end