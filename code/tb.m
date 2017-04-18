function [t20,t100,t200,b200,b100,b20]=tb(y_rank,y_test)
p1=find(y_rank<=20);
t20=sum(y_test(p1))/20;
p2=find(y_rank<=100);
t100=sum(y_test(p2))/100;
p3=find(y_rank<=200);
t200=sum(y_test(p3))/200;
p4=find(y_rank>=541);
b200=sum(y_test(p4))/200;
p5=find(y_rank>=641);
b100=sum(y_test(p5))/100;
p6=find(y_rank>=721);
b20=sum(y_test(p6))/20;