function rc_value=rc(y_rank,y_truth)
y2=y_truth;
y1=y_rank;
m=length(y1);
    b1=0;
    for j=1:m
    a1=(y2(j,1)-y1(j,1))^2;
    b1=b1+a1;
    end
    rc_value=1-((6*b1)/(m*(m^2-1)));