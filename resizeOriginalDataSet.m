function [ resizedDataSet ] = resizeOriginalDataSet( DataSet,n,dataSetId )

%--------------------------------------------------------------
% Resizing images of the original data set into a smaller images 
%--------------------------------------------------------------

[rows, ~] = size(DataSet);

        % Yale
        if (dataSetId=='Y')
             r=168;
             c=192;
        end
        %CMU
        if (dataSetId=='C')
             r=32;
             c=32;
        end
        
        %CMU
        if (dataSetId=='S')
             r=80;
             c=80;
        end

        for i=1:rows
          temp=DataSet(i,:);
          temp=reshape(temp,r,c)';

          temp=imresize(temp,[n n]);
          temp=reshape(temp',1,n*n);
          resizedDataSet(i,:)=temp;

        end
end

