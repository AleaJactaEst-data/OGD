function [u,J,p,it] = res_aux_1(Q,b_,C,d,rho_prix,EPS,eps_prix,itmax,p_0,u_0,condition_kkt)
%Probleme auxiliaire 
m=size(C,1);
N=size(C,2);
A=2*diag(diag(Q));

uk1=u_0;
pk1=p_0;
it=0;

b=zeros(N,1);

%itération
stop_condition=false;
while it<itmax && ~stop_condition
    u=uk1;
    p=pk1;
    b=b_-0.5*(Q-A)*u;
    [~,uk1,~,pk1] = prix(A,b,C,d,rho_prix,eps_prix,1000,p);
    
    stop_condition=norm(u-uk1,inf)<EPS && norm(p-pk1,inf)<EPS;
    it=it+1;
end

J=1/2*u'*Q*u-b_'*u;
if condition_kkt
    kkt=test_KKT(u, p, A,b,C,d)
end

end

