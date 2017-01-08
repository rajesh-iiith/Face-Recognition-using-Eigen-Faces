function [ ] = verification(dataSetId, trainSet, testSet, trainLabels, testLabels)

%---------------------------------------------------------------------
% Finding accuracy for verification task: Student data set: YALE & CMU
%---------------------------------------------------------------------

% dimension of eigen space
eigenSpaceDimension = 45;

%CMU
if (dataSetId=='C')
    noOfSubjects=68;
    theta=0.07284;
    % Creating EigenFaces using training set
    [ c_eigenFaces, c_B, c_meanVector, c_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( c_B, testSet, c_eigenFaces, c_meanVector );
end

%yale
if (dataSetId=='Y')
    noOfSubjects=38;
    theta=0.558;
    % Creating EigenFaces using training set
    [ y_eigenFaces, y_B, y_meanVector, y_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( y_B, testSet, y_eigenFaces, y_meanVector );
end

[~,c] = size(fv_test);
[r1,~] = size(trainLabels);
correctClaimAccuracy = 0;
incorrectClaimAccuracy = 0;

    for i=1:c
        testImage=fv_test(:,i);
        for j=1:noOfSubjects
            claimId=j;
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
%             if(i==1)
%                 display(distance);
%             end
            if distance<theta
               % Similar Image
               if (claimId == testLabels(i,1))
                   correctClaimAccuracy = correctClaimAccuracy + 1;
               end
            else
               % Dissimilar Image
               if(claimId ~= testLabels(i,1))
                   incorrectClaimAccuracy = incorrectClaimAccuracy + 1;
               end
            end
            
        end
    end
    
    display(incorrectClaimAccuracy);
    display(correctClaimAccuracy);
    display((incorrectClaimAccuracy + correctClaimAccuracy)/(c*noOfSubjects)*100);
end

