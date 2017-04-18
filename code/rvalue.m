function r_value=rvalue(y_pre,y_test)
s=y_test;
v=y_pre;
m=length(v);
a1=sum(s(:,1))/m;
    a=0;b=0;c=0;
    a2=sum(v(:,1))/m;
    for j=1:m
         a=a+(v(j,1)-a2)*(s(j,1)-a1);
         b=b+(v(j,1)-a2)^2;
         c=c+(s(j,1)-a1)^2;
    end
    r_value=a/(b^0.5*c^0.5);