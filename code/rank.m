%% Ô¤²â·ÖÊýÔ¤²â
function y1=rank(y_pre)
[r,index]=sort(y_pre,'descend');
s=length(y_pre);
for k=1:s
    y1(index(k),:)=k;
end