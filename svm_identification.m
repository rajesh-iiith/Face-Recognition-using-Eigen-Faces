function [ ] = svm_identification(trainLabels, testLabels, fv_train, fv_test)

%-----------------------------------
% Finding accuracy using svmpredict
%------------------------------------

    model = svmtrain(trainLabels, fv_train', '-t 0');
   [predict_label, accuracy, dec_values] = svmpredict(testLabels, fv_test', model);

end

