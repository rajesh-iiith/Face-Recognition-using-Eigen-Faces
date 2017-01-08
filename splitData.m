function [ trainSet, testSet, trainLabels, testLabels ] = splitData( resizedDataSet, id ,Labels,dataSetId)

%-----------------------------------------------------------
% Spilitting the data for 4-fold cross validation
%-----------------------------------------------------------

trainCount=1;
testCount=1;
[rows, ~] = size(resizedDataSet);



switch dataSetId
    case 'Y'

            for i=1:rows
                remainder=rem(i,20);
                if remainder == 0
                    remainder = 20;
                end
                start=(id-1)*5+1;
                stop=(id*5);
                if (remainder>=start && remainder<=stop)
                    testSet(testCount,:)=resizedDataSet(i,:);
                    testLabels(testCount,1)=Labels(i,1);
                    testCount=testCount+1;
                else
                    trainSet(trainCount,:)=resizedDataSet(i,:);
                    trainLabels(trainCount,1)=Labels(i,1);
                    trainCount=trainCount+1;
                end
            end
            
      case 'C'      
            for i=1:rows
                remainder=rem(i,42);
                if remainder == 0
                    remainder = 42;
                end
                start=(id-1)*10+1;
                stop=(id*10);
                if (remainder>=start && remainder<=stop)
                    testSet(testCount,:)=resizedDataSet(i,:);
                    testLabels(testCount,1)=Labels(i,1);
                    testCount=testCount+1;
                else
                    trainSet(trainCount,:)=resizedDataSet(i,:);
                    trainLabels(trainCount,1)=Labels(i,1);
                    trainCount=trainCount+1;
                end
            end


end

end

