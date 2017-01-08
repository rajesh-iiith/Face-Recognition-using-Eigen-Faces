function [] = Verify( dataSetId, imagePath, claimId, trainSet, trainLabels )

%------------------------------------------
% Verifying a sample image against a claim
%-------------------------------------------

% dimension of eigen space
eigenSpaceDimension = 7;

if(dataSetId == 'Y')
    h = 100;
end
if(dataSetId == 'C')
    h = 32;
end

inputImage = imread(imagePath);
inputImage = imresize(inputImage, [h, h]);
testSet(1, :) = reshape(inputImage', 1, h*h);

%yale
if (dataSetId=='Y')
    theta=0.2;
    % Creating EigenFaces using training set
    [ y_eigenFaces, y_B, y_meanVector, y_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( y_B, testSet, y_eigenFaces, y_meanVector );
end

%CMU
if (dataSetId=='C')
    theta=0.04;
    % Creating EigenFaces using training set
    [ c_eigenFaces, c_B, c_meanVector, c_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( c_B, testSet, c_eigenFaces, c_meanVector );
end

[r1,~]=size(trainLabels);

            testImage=fv_test(:,1);
            average=zeros(eigenSpaceDimension,1);
            count=0;
            for k=1:r1
                if trainLabels(k,1)== claimId
                    average=average+ fv_train(:,k);
                    count=count+1;
                end
            end
            average=average/count;
            distance=sum((testImage-average).^2);
            distance = distance / 10^7;
            display(distance);
            if distance<theta
                % Similar Image
                display('YES');
            else
               % Dissimilar Image
               display('NO');
            end

end

