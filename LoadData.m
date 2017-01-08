function [ trainSet, testSet, trainLabels, testLabels ] = LoadData(dataSetId, foldId)

switch dataSetId
    case 'Y'
        % Load data and labels :YALE
            load YaleDataSet.mat;
            load YaleLabels.mat;
            
        % Preprocessing the data 
            [ resizedDataSet ] = resizeOriginalDataSet( DataSet,100,dataSetId );
            [ trainSet, testSet, trainLabels, testLabels ] = splitData( resizedDataSet, foldId ,Labels,dataSetId);
         
    case 'C'
        % Load data and labels :CMU
            load CmuPieDataSet.mat;
            load CmuPieLabels.mat;

        % Preprocessing the data 
            [ resizedDataSet ] = resizeOriginalDataSet( CmuPieDataSet,32,dataSetId );
            [ trainSet, testSet, trainLabels, testLabels ] = splitData( resizedDataSet, foldId ,CmuPieLabels,dataSetId);
     
    case 'S'
        % Load data and labels :CMU
            load newStudentDataset.mat;
            load newStudentTags.mat;
            load s_tags.mat;

        % Preprocessing the data 
            [ resizedDataSet ] = resizeOriginalDataSet( newStudentDataset,80,dataSetId );
            [ trainSet, testSet, trainLabels, testLabels ] = holdOneOut( resizedDataSet, foldId , s_tags,dataSetId);

        % Creating EigenFaces using training set
            % [eigenFaces, B, meanVector,v] = createEigenFaces( trainSet ,k,dataSetId);
    otherwise
        disp('Enter Y/C');
end

end

