function [ fv_train, fv_test ] = identification( dataSetId, trainSet, trainLabels, testSet, testLabels)

%-------------------------------------------
% Finding accuracy for identification task 
%-------------------------------------------

eigenSpaceDimension = 45;

%yale : Eigen faces generation and eigen space mapping

if (dataSetId=='Y')
    noOfSubjects=38;
    % Creating EigenFaces using training set
    [ y_eigenFaces, y_B, y_meanVector, y_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( y_B, testSet, y_eigenFaces, y_meanVector );
end

%CMU: Eigen faces generation and eigen space mapping

if (dataSetId=='C')
    noOfSubjects=68;
    % Creating EigenFaces using training set
    [ c_eigenFaces, c_B, c_meanVector, c_v] = createEigenFaces( trainSet , eigenSpaceDimension, dataSetId);
    [ fv_train, fv_test ] = EigenSpaceMapping( c_B, testSet, c_eigenFaces, c_meanVector );
end

[~,c]=size(fv_test);
[computedLabels] = getKNN(noOfSubjects, fv_train, fv_test, trainLabels);
display((sum(computedLabels' == testLabels)/c)*100);

end