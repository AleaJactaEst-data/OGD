function [it,u,sumJ,pk] = prix(A,b,C,d,rho_prix,eps_prix,itmax,p0)
%decomposition par le prix
m=length(d);
N=length(A);
if nargin<8
    p0=zeros(m,1);
end
%initialisation
diff=1;
pk1=p0;
it=0;
u=zeros(N,1);

%iteration
while it<itmax && diff>eps_prix
    pk=pk1;
    for i =1:N
        u(i)=A(i,i)\(-C(:,i)'*pk+b(i));
    end
    pk1=max(pk+rho_prix*(C*u-d),0);
    diff=norm(pk-pk1,inf);
    it=it+1;
end
sumJ=0.5*u'*A*u-b'*u;
end

