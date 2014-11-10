function [result] = svmclassifier(TestSet,models,GroupTrain)
%classify test cases
u=unique(GroupTrain);
numClasses=length(u);
[m n]=size(TestSet);
disp(m);
disp(n);
[m n]=size(models(1));
disp(models(1));
disp(m);
disp(n);
for j=1:size(TestSet,1)
    for k=1:numClasses
        if(svmclassify(models(k),TestSet(j,:))) 
            break;
        end
    end
    result(j) = k;
end
