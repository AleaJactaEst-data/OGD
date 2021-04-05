function [u,J,p,it] = res_aux_2(e,Q,C_,d,rho_p,EPS,eps_p,itmax,p_0,u_0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=size(C_,1)+1;
N=size(C_,2);


uk1=u_0;
pk1=p_0;
it=0;

arret=false;

while it<itmax && ~arret
    u=uk1;
    p=pk1;
    A=eye(N);

    b=e+2*Q*u;

    C=[(Q*u)';C_];

    [~,uk1,~,pk1] = prix(A,b,C,d,rho_p,eps_p,1000,p);
    %uk1=A\b;
    
    arret=norm(u-uk1,inf)<EPS && norm(p-pk1,inf)<EPS;
    it=it+1;
end
J=e'*u;

end

