matit=dlmread('matit.txt');
chit=dlmread('chit.txt');
mytree=treefit(matit, chit, 'method', 'classification', 'splitmin', 2, 'prune', 'off', 'splitcriterion', 'deviance');
%treedisp(mytree);
%modelit=multisvm_train(mat,chit);

for iiit=1:1000

prompt = 'Enter the file path of the input file : ';
str = input(prompt, 's');
if strcmp(str,'quit')==1
    break;
end
I = imread(str);
I0 = ~im2bw(I, 0.3);
I = rgb2gray(I);
figure;
imshow(I0);

CC = bwconncomp(I0, 8);
I1 = bwlabel(I0, 8);
figure;
imshow(I1, []);

I2 = label2rgb (I1, 'hsv', 'k', 'shuffle');
figure;
imshow(I2, []);

M = regionprops(I1, I, 'all');
for k = 1 : CC.NumObjects           % Loop through all blobs.
    % Find the bounding box of each blob.
	thisBlobsBoundingBox = M(k).BoundingBox;  % Get list of pixels in current blob.
	% Extract out this coin into it's own image.
	subImage = imcrop(I0, thisBlobsBoundingBox);
    C1 = bwconncomp(subImage, 8);
    numPixels = cellfun(@numel,C1.PixelIdxList);
    [biggest,idx] = max(numPixels);
    for i = 1:C1.NumObjects
        if i ~= idx
            subImage(C1.PixelIdxList{i}) = 0;
        end
    end
	% Display the image with informative caption.
	figure;
    
    %calculating 7 transforms
    matit=zeros(1,7);
    valit=feature_vec(subImage);
    doit=size(valit);
    doit=doit(1);
    p=valit';
    matit(1,1:7)=p;
    
    %calculating Zernik's moments
    %{
    valit=Zernike_main(imgname);
    matit(1,8:9)=valit;
    %}
        
    imshow(subImage);
    estimate1=treeval(mytree,matit);
    disp(estimate1);
    %result=svmclassifier(matit,modelit,chit);
end
end
