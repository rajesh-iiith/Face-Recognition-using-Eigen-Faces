function [eigenFaces, B, meanVector, v] = createEigenFaces( trainSet,k,dataSetId )
%--------------------------------------------------------------------------
%Generation of Eigen face from the given Data Set
%--------------------------------------------------------------------------

%yale
    if (dataSetId=='Y')
        h=10000;
    end

%CMU
    if (dataSetId=='C')
        h=1024;
    end

%Student
    if (dataSetId=='S')
        h=6400;
    end

meanVector=double(zeros(h,1));

% Constructing A matrix
     A=trainSet';
     [~, columns]=size(A);
     
% Compute Mean Vector
    for i=1:columns
       meanVector=meanVector + double(A(:,i));
    end
    
    meanVector = meanVector/columns;
    meanVector = uint8(meanVector);
    
    
% Displaying mean image :Uncomment the following for mean image
% construction
         %meanImage=reshape(meanVector,100,100)';
         %display(meanImage);
         %imshow(meanImage);

% Subtracting mean from A vector
    for i=1:columns
       B(:,i) = double(A(:,i))-double(meanVector);
    end
    

% Create L Matrix
    temp=double(B');
    L=temp*double(B);
    
% Find eigen vectors of L
    [v,d]=eig(L);
    [~,c]=size(d);
    
% Sort eigen values
        for i=1:c
           eSorted(i,:)=[d(i,i), i];
        end
        eSorted = sortrows(eSorted,1);
    
% Compute Eigen Faces of top K Eigen Values
   
    j=1;
    removeTopK=2;
    %Note: use the upper loop code for not removing top k eigen vectors
    % for i=c:-1:(c-k+1)
    for i=c-removeTopK:-1:(c-k+1)-removeTopK;
    % for i=1:k
        eigenFaces(:,j)=double(B)*v(:,eSorted(i,2));
        eigenFaces(:,j)=eigenFaces(:,j)/norm(eigenFaces(:,j));
        j=j+1;    
    end
    
    
  
% Plot Information Curve: Uncommment the following for plotting

%     xAxis=[1:c];
%     sumEvalues=sum(eSorted);
%     partialSum=0;
%     for i=1:c
%         partialSum=partialSum+eSorted(i);
%         yAxis(i)=partialSum/sumEvalues;
%     end
%     %plot(xAxis,yAxis);

% Eigen Face Generation
    
end

