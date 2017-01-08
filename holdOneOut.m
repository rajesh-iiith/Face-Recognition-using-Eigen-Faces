function [ trainSet, testSet, trainLabels, testLabels ] = holdOneOut( resizedDataSet, id ,Labels,dataSetId)

%--------------------------------------------------------------------------
% Splitting the data set into 2 sets (training data size: 1, testing data size: n-1)
%--------------------------------------------------------------------------

trainCount=1;

[rows, ~] = size(resizedDataSet);

           for i=1:rows
                    if(i==id)
                        testSet(1,:)=resizedDataSet(i,:);
                        testLabels(1,1)=Labels(i,1);
                    else
                        trainSet(trainCount,:)=resizedDataSet(i,:);
                        trainLabels(trainCount,1)=Labels(i,1);
                        trainCount=trainCount+1;
                    end
           end
end



