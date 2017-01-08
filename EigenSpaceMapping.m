function [ fv_train, fv_test ] = EigenSpaceMapping( B, testSet,eigenFaces,meanVector )

%--------------------------------------------------------------------------
%Generation of reduced dimension feature vectors
%--------------------------------------------------------------------------
 
    ef=eigenFaces';

    temp_train=B;
    fv_train=ef*double(temp_train);

    temp_test=testSet';
    [~,c]=size(temp_test);
    
    for i=1:c
        final_temp_test(:,i)=double(temp_test(:,i))-double(meanVector);
    end
    
    % display(final_temp_test);
    fv_test=ef*double(final_temp_test);
end

