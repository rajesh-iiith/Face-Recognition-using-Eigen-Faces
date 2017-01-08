function [] = plotROC(fv_train)

%--------------------------------------------------------------
% Plotting ROC curve and generating threshold for verification  
%---------------------------------------------------------------


% numOfImagesInEachClass = 32;
% numOfClass = 68;
% numOfPairs = 14;
numOfImagesInEachClass = 6;
numOfClass = 76;
numOfPairs = 14;

p = numOfPairs * numOfClass;

c1 = 1;
c2 = 1;
c3 = 1;

for i = 1:p
    a(i, 1) = c1;
    
    c2 = c2 + 1;
    a(i, 2) = c2;
    
    
    if(rem(i, numOfPairs) == 0)
        c1 = c3 * numOfImagesInEachClass + 1;
        c2 = c1;
        c3 = c3 + 1;
    end
end

for i = 1:p
    b1=fv_train(:, a(i,1));
    b2=fv_train(:, a(i,2));
    b(i)=sum((b1-b2).^2);
end

c1 = 1;
c2 = 1;

for i = 1:p
    a(i, 1) = c1;
    
    c2 = c2 + numOfImagesInEachClass;
    a(i, 2) = c2;
    
    
    if(rem(i, numOfClass-1) == 0)
        c1 = c1 + 1;
        c2 = 1;
    end
end

for i = 1:p
    b1=fv_train(:, a(i,1));
    b2=fv_train(:, a(i,2));
    c(i)=sum((b1-b2).^2);
end

labels = [ones(1, p) zeros(1, p)] ;
scores = [c'; b']';

[x, y, t, k, opt] = perfcurve(labels, scores,1);

display(k);

[r, ~] = size(x);
for i = 1 : r
    if x(i) == opt(1) && y(i) == opt(2)
        display(t(i));
    end
end

plot(x,y);

end