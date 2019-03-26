function comb_augment(Mode, image_dir, dataset)
orgimg = imread(image_dir);
start = [1 1 127 127];
rotate = 50;
trans = 10;

if(strcmp(dataset, 'train'))

    if(Mode==1 || Mode==6) %scale + rotate
        tmp = imresize(orgimg, 1.5);
        tmp = imrotate(tmp,10,'bilinear','crop');
        point1= start;
        point1(1) = point1(1)+rotate;
        point1(2) = point1(2)+ rotate;
        I1 = imcrop(tmp, point1);
        newDir = replace(image_dir,'/train/','/train_aug/');
        newDir2 = replace(newDir,'.png','_aug1.png')
        imwrite(I1, newDir2);

    end

    if(Mode==2 || Mode==6) %scale + Translate
        tmp = imresize(orgimg, 1.5);
        point2= start;
        point2(1) = point2(1)+trans;
        point2(2) = point2(2)+ trans;
        I2 = imcrop(tmp, point2);
        newDir = replace(image_dir,'/train/','/train_aug/');
        newDir2 = replace(newDir,'.png','_aug2.png')
        imwrite(I2, newDir2);
    end

    if(Mode==3 || Mode==6) %scale + reflection
        tmp = flip(orgimg);
        tmp = imresize(tmp, 1.5);
        I3 = imcrop(tmp, start);
        newDir = replace(image_dir,'/train/','/train_aug/');
        newDir2 = replace(newDir,'.png','_aug3.png')
        imwrite(I3, newDir2);

    end
    if(Mode==4 || Mode==6) % reflection + rotation
        tmp = imrotate(orgimg,10,'bilinear','crop');
        point4= start;
        point4(1) = point4(1)+rotate;
        point4(2) = point4(2)+ rotate;
        tmp = imcrop(tmp, point4);
        I4 = flip(tmp);
        newDir = replace(image_dir,'/train/','/train_aug/');
        newDir2 = replace(newDir,'.png','_aug4.png')
        imwrite(I4, newDir2);
    end 

    if(Mode==5 || Mode==6) % rotate + Translate
        tmp = imrotate(orgimg,10,'bilinear','crop');
        point5= start;
        point5(1) = point5(1)+ rotate+4;
        point5(2) = point5(2)+ rotate+4;
        I1 = imcrop(tmp, point5);
        newDir = replace(image_dir,'/train/','/train_aug/');
        newDir2 = replace(newDir,'.png','_aug5.png')
        imwrite(I1, newDir2);
    end 

end

if(strcmp(dataset, 'test')) %scale + rotate
    
       if(Mode==1 || Mode==6) %scale + rotate
        tmp = imresize(orgimg, 1.5);
        tmp = imrotate(tmp,10,'bilinear','crop');
        point1= start;
        point1(1) = point1(1)+rotate;
        point1(2) = point1(2)+ rotate;
        I1 = imcrop(tmp, point1);
        newDir = replace(image_dir,'/test/','/test_aug/');
        newDir2 = replace(newDir,'.png','_aug1.png')
        imwrite(I1, newDir2);

        end

    if(Mode==2 || Mode==6) %scale + Translate
        tmp = imresize(orgimg, 1.5);
        point2= start;
        point2(1) = point2(1)+trans;
        point2(2) = point2(2)+ trans;
        I2 = imcrop(tmp, point2);
        newDir = replace(image_dir,'/test/','/test_aug/');
        newDir2 = replace(newDir,'.png','_aug2.png')
        imwrite(I2, newDir2);
    end

    if(Mode==3 || Mode==6) %scale + reflection
        tmp = flip(orgimg);
        tmp = imresize(tmp, 1.5);
        I3 = imcrop(tmp, start);
        newDir = replace(image_dir,'/test/','/test_aug/');
        newDir2 = replace(newDir,'.png','_aug3.png')
        imwrite(I3, newDir2);

    end
    if(Mode==4 || Mode==6) % reflection + rotation
        tmp = imrotate(orgimg,10,'bilinear','crop');
        point4= start;
        point4(1) = point4(1)+rotate;
        point4(2) = point4(2)+ rotate;
        tmp = imcrop(tmp, point4);
        I4 = flip(tmp);
        newDir = replace(image_dir,'/test/','/test_aug/');
        newDir2 = replace(newDir,'.png','_aug4.png')
        imwrite(I4, newDir2);
    end 

    if(Mode==5 || Mode==6) % rotate + Translate
        tmp = imrotate(orgimg,10,'bilinear','crop');
        point5= start;
        point5(1) = point5(1)+ rotate+4;
        point5(2) = point5(2)+ rotate+4;
        I1 = imcrop(tmp, point5);
        newDir = replace(image_dir,'/test/','/test_aug/');
        newDir2 = replace(newDir,'.png','_aug5.png')
        imwrite(I1, newDir2);
    end  

end
end