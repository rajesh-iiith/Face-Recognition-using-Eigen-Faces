function [computedLabels] = getKNN(numberOfClasses, fv_train, fv_test, trainLabels)
%--------------------------------------------------------------------------
%Generating lebels according to k-NN Algorithm
%--------------------------------------------------------------------------
    
 % Setting the k value for k-NN
    kNN = 1;

    [~, train_col] = size(fv_train);
    [~, test_col] = size(fv_test);

    for i = 1:test_col
        for j = 1:train_col
            distance(j,:) = [sum((fv_test(:,i) - fv_train(:,j)).^2), trainLabels(j)];
        end
        distance = sortrows(distance, 1);
        
        tempLabel = zeros(1, numberOfClasses);
        for z = 1:kNN
            tempLabel(distance(z,2)) = tempLabel(distance(z,2)) + 1;
        end
        tempLabels = find(tempLabel == max(tempLabel));
        computedLabels(i) = tempLabels(1);
    end
        % display(computedLabels);
        %display(sum(computedLabels' == testLabels))
    
    
end

