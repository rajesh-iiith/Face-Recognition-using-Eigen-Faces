%-----------------------------------------------------------------------
% Looping through identification function to find cumulactive accuracy of
% different sets of test and train data
%------------------------------------------------------------------------

 accuracy=0;
load s_tags.mat; 


% Code for identification: Start 
prev = 0;
for i=1:483
    
    if prev == s_tags(i, 1)
        continue;
    else
        accuracy=accuracy+s_identification( 'S', i );
        prev = s_tags(i,1);
    end

end
display(accuracy/76);
% Code for identification: End

% Code for verification: Start 

% for i=1:2
%     [a,~]=s_verification('S',i);
%     accuracy=accuracy+  a;
% end
% display(accuracy/2);

% Code for identification: End