function [ ] = identify( dataSetId, imagePath, trainSet, trainLabels )

%-------------------------------------------
% identifying label of a given image sample 
%-------------------------------------------

eigenSpaceDimension = 7;

%yale
if (dataSetId=='Y')
    h=100;
end

%CMU
if (dataSetId=='C')
    h=32;
end

inputImage = imread(imagePath);
inputImage = imresize(inputImage, [h, h]);
testSet(1, :) = reshape(inputImage', 1, h*h);

%yale
if (dataSetId=='Y')
    noOfSubjects=38;
    % Creating EigenFaces using training set
    [ y_eigenFaces, y_B, y_meanVector, y_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( y_B, testSet, y_eigenFaces, y_meanVector );
end

%CMU
if (dataSetId=='C')
    noOfSubjects=68;
    % Creating EigenFaces using training set
    [ c_eigenFaces, c_B, c_meanVector, c_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( c_B, testSet, c_eigenFaces, c_meanVector );
end

[computedLabels] = getKNN(noOfSubjects, fv_train, fv_test, trainLabels);
display(computedLabels);

end

