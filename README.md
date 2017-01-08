---------------------------------LOADING THE DATA--------------------------------

Before running any experiment, please load the data.
Steps:
1. Go to command window in MATLAB
2. for loading the YALE Data set, execute the following command.
	[ y_trainSet, y_testSet, y_trainLabels, y_testLabels ] = LoadData('Y', 2);
   for loading the CMU-PIE data set, execute the following command.		
	[ c_trainSet, c_testSet, c_trainLabels, c_testLabels ] = LoadData('C', 4);
 Note: second argument of the LoadData function represents the fold id: (1/2/3/4)



Once loading is done, one can perform any of the following experimaents.


-----------------------------VERIFY AN IMAGE AGAINST A CLAIM-------------------------

Run the following command in the comand window:

YALE:


	Verify( 'Y', imagePath, claimId, y_trainSet, y_trainLabels );
Example:
	Verify( 'Y', 'YALE_Class01_01.bmp', 1, y_trainSet, y_trainLabels );

CMU-PIE:


	Verify( 'C', imagePath, claimId, c_trainSet, c_trainLabels );
Example:
	Verify( 'C', 'CMU_Class01_01.bmp', 1, c_trainSet, c_trainLabels );

	


-------------------------------IDENTIFY AN IMAGE-------------------------

Run the following command in the comand window:

YALE:


	identify( 'Y', imagePath, y_trainSet, y_trainLabels );
Example:
	identify( 'Y', 'YALE_Class01_01.bmp', y_trainSet, y_trainLabels );


CMU-PIE:


	identify( 'C', imagePath, c_trainSet, c_trainLabels );
Example:
	identify( 'C', 'CMU_Class01_01.bmp', c_trainSet, c_trainLabels );


-------------------------------FIND THE ACCURACY: IDENTIFICATION-------------------------

Run the following command in the comand window:

YALE:


	[ y_fv_train, y_fv_test ] = identification( 'Y', y_trainSet, y_trainLabels, y_testSet, y_testLabels);



CMU-PIE:


	[ c_fv_train, c_fv_test ] = identification( 'C', c_trainSet, c_trainLabels, c_testSet, c_testLabels);


-------------------------------FIND THE ACCURACY: VERIFICATION-------------------------

Run the following command in the comand window:

YALE:


	verification('Y', y_trainSet, y_testSet, y_trainLabels, y_testLabels);


CMU-PIE:


	verification('C', c_trainSet, c_testSet, c_trainLabels, c_testLabels);


-------------------------------FIND THE ACCURACY: IDENTIFICATION[SVM]-------------------------

Run the following command in the comand window:

	svm_identification(y_trainLabels, y_testLabels, y_fv_train, y_fv_test);


-------------------------------RECONSTRUCT IMAGE-----------------------------------------------

Run the following command in the comand window:


	reconstructImage('Y', y_trainSet, 'monkey.bmp');

Note: For student data set verification and identification accuracy, run the script s_main






