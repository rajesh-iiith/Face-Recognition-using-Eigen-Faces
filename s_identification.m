function [ flag ] = s_identification( dataSetId, testImageId )

%-----------------------------------------------------------
% Finding accuracy for identification task: Student data set
%-----------------------------------------------------------

eigenSpaceDimension = 45;



[ s_trainSet, s_testSet, s_trainLabels, s_testLabels ] = LoadData('S', testImageId);
[noOfSubjects,~]=size(unique(s_trainLabels));

[ s_eigenFaces, s_B, s_meanVector, s_v] = createEigenFaces( s_trainSet , eigenSpaceDimension, dataSetId);
[ fv_train, fv_test ] = EigenSpaceMapping( s_B, s_testSet, s_eigenFaces, s_meanVector );

[~,c]=size(fv_test);

    model = svmtrain(s_trainLabels, fv_train', '-t 0');
   [predict_label, accuracy, dec_values] = svmpredict(s_testLabels, fv_test', model);

        % [computedLabels] = getKNN(noOfSubjects, fv_train, fv_test, s_trainLabels);
        % display(computedLabels);
        % flag=((sum(computedLabels' == s_testLabels)));

flag=((sum(predict_label' == s_testLabels)));

end

