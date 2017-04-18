function [A,B]=optimization(train,y_train,lamda,alpha,beta)
% The optimization function of method
% Input: Feature matrix(N*D) and memorability score vector (N*1) of training set (train,y_train)
%           Parameters in object function
% Output: A,B,E. A is low-rank projection matrix, B is sparse coefficient vector 

%% Initialization
[N,L]=size(train);
X=train;
y=y_train;
maxIter=10; maxIter2=6;                    %迭代次数
t1=10e-4;t2=10e-10;t3=10e-7;
mu=0.1;mumax=10e10;rou0=1.1;Y1=0;Y2=0;
b=0;a=0.6;
A=eye(L);
B=eye(L,1);
E=zeros(N,L);
load('.\data\w.mat');
W=w;
%% Iteration
% while (e1>t1&&e2>t2&&i<maxIter)
while(b<maxIter)
    B0=B;b=b+1;i=0;
    while(i<maxIter2)
    i=i+1;
    A0=A;E0=E;W0=W;mu0=mu;Y10=Y1;Y20=Y2;
    %% Update A    
     D=norm(X,2);    
    eta1=D^2;
    Z1=A0-((-1*X')*(X-X*A0-E0+Y1/mu)+(W0-A0*B0+Y2/mu)*(-1*B0'))/eta1;
    [U1,S1,V1]=svd(Z1);
    gamma1=alpha/(eta1*mu);
    c=max(abs(S1)-gamma1,0).*sign(S1);
    A=U1*c*V1';
    
    %% Update E
    Z2=X-X*A+Y1/mu;
    [d,l]=size(Z2);
    gamma2=beta/mu;
    for j=1:l
         Q=norm(Z2(:,j),2);
        if Q>gamma2
            E(:,j)=(Q-gamma2)/Q*Z2(:,j);
        else
            E(:,j)=0;
        end
    end
    
    %% Update W
    D=norm((sqrt(2/mu)*X),2);
    eta2=D^2;
    gamma3=lamda/(eta2*mu);
    Z3=W0-((-1*X')*sqrt(2/mu)*(y-X*W0)+(W0-A*B0+Y2/mu))/eta2;
    W=max(abs(Z3)-gamma3,0).*sign(Z3);
    e1=max(max(abs(X-X*A-E)));
    e2=max(abs(W-A*B));
    
    %% Update parameters
    Y1=Y10+mu*(X-X*A-E);
    Y2=Y20+mu*(W-A*B);
    mu=min(mumax,rou0*mu0);
    fprintf('误差为%d\n',e1,e2);
    fprintf('完成第%d-%d次迭代\n',b,i);
    end
    
    
    %% Update B
    B=a*B0+(1-a)*pinv(A'*A)*A'*(W+Y2/mu); 
    e3=max(abs(B-B0));
    
    %% Display
    fprintf('误差为%d\n',e3);
    fprintf('完成第%d次迭代\n',b);
    
end