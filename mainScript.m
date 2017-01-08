% Calling LoadData
[ y_trainSet, y_testSet, y_trainLabels, y_testLabels ] = LoadData('Y', 2);

% [ y_fv_train, y_fv_test ] = identification( 'Y', y_trainSet, y_trainLabels, y_testSet, y_testLabels);
% identify( 'Y', imagePath, y_trainSet, y_trainLabels );

% verification('Y', y_trainSet, y_testSet, y_trainLabels, y_testLabels);
% Verify( 'Y', imagePath, claimId, y_trainSet, y_trainLabels );
% Example: Verify( 'Y', 'YALE_Class01_01.bmp', 1, y_trainSet, y_trainLabels );

% svm_identification(y_trainLabels, y_testLabels, y_fv_train, y_fv_test);

% reconstructImage('Y', y_trainSet, 'monkey.bmp');

% [ c_trainSet, c_testSet, c_trainLabels, c_testLabels ] = LoadData('C', 4);

% [ c_fv_train, c_fv_test ] = identification( 'C', c_trainSet, c_trainLabels, c_testSet, c_testLabels);
% identify( 'C', imagePath, c_trainSet, c_trainLabels );

% verification('C', c_trainSet, c_testSet, c_trainLabels, c_testLabels);
% Verify( 'C', imagePath, claimId, c_trainSet, c_trainLabels );
% Example: Verify( 'C', 'CMU_Class01_01.bmp', 1, c_trainSet, c_trainLabels );