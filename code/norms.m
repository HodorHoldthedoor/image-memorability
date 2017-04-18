function y_norm=norms(y_pre,y_test)
ma=max(y_pre);
mi=min(y_pre);
ma1=max(y_test);
mi1=min(y_test);
s=length(y_pre);
for i=1:s
    y_norm(i,:)=(y_pre(i)-mi)/(ma-mi)*(ma1-mi1)+mi1;
end