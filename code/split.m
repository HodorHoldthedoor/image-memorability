%split.m
%randomly split the image memorability dataset into 3 folds, 2 for training
%and 1 for testing.
load('anno_feats.mat');
load('score.mat');
in=randperm(2222,M);
index=sort(in);
% index=index';
train=anno_feats(index,:);
y_train=y(index,:);
q=0;
for m=1:2222
     p=find(index==m);
     if (isempty(p))
         q=q+1;
         test(q,:)=anno_feats(m,:);
         y_test(q,:)=y(m,:);
     end
end
save('train.mat','train');save('y_train.mat','y_train');
save('test.mat','test');save('y_test.mat','y_test');
