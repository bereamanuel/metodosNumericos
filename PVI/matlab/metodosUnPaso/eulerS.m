function [t,Y] = EulerS(F,a,b,N,Ya)
h=(b-a)/N;
t=a:h:b;
t=t(:);
Y=zeros(N+1,length(Ya));
Y(1,:)=Ya;
for k=1:N
Y(k+1,:)=Y(k,:)+h*feval(F,t(k),Y(k,:))';
end
end