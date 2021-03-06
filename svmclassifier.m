function [result] = svmclassifier(TestSet,models,GroupTrain)
%classify test cases
u=unique(GroupTrain);
numClasses=length(u);
[m n]=size(TestSet);
%disp(m);
%disp(n);
[m n]=size(models(1));
%disp(models(1));
%disp(m);
%disp(n);
flag = 0;
for j=1:size(TestSet,1)
    flag = 0;
    for k=1:numClasses
        if(group = svmclassify(models(k),TestSet(j,:)))
            flag = 1;
            break;
        end
    end
    if(flag)
        result(j) = group;
        fprintf('%d\n', group);
    else
        result(j) = -1;
        fprintf('No Match for this letter found\n');
    end
end
