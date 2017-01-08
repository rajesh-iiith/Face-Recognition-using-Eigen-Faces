function [imgRe] = reconstructImage(dataSetId, trainSet, imagePath)

%----------------------------------------------------------
% Reconstructing Face and non face images using eigen faces 
%----------------------------------------------------------

eigenSpaceDimension = 7;

if (dataSetId=='Y')
   h = 100; 
end
if (dataSetId=='C')
   h = 32; 
end

nonface = imread(imagePath);
nonface = imresize(nonface, [h, h]);
testSet(1, :) = reshape(nonface', 1, h*h);

%yale
if (dataSetId=='Y')
    [ y_eigenFaces, y_B, y_meanVector, y_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ ~, fv_test ] = EigenSpaceMapping( y_B, testSet, y_eigenFaces, y_meanVector );
    eigenFaces = y_eigenFaces;
    meanVector = y_meanVector;
end

%CMU
if (dataSetId=='C')
    [ c_eigenFaces, c_B, c_meanVector, c_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ ~, fv_test ] = EigenSpaceMapping( c_B, testSet, c_eigenFaces, c_meanVector );
    eigenFaces = c_eigenFaces;
    meanVector = c_meanVector;
end
    
fvt = fv_test(:,1);
img = zeros(h*h, 1);

for i = 1:eigenSpaceDimension
img = img + fvt(i) * eigenFaces(:, i);
end
img = img + double(meanVector);
% scaleImg = img/10^10;
img = uint8(img);
imgRe = reshape(img, h, h)';
imshow(imgRe);

end

