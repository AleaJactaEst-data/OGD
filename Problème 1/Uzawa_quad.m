function [ u,J ,mu,it] = Uzawa_quad( A,b,C,d,rho,mu0, espsi, maxiter)
%A SDP, mu0 positif

% gestion de la fonction si maxiter n'est pas donnee
if nargin<8
    maxiter=1000;
end

% initialisation
mu=mu0;

diff = [1,1];
% premiere resolution
u=A\(b-C'*mu);

%mise a jour de mu
mu=max(0,mu+rho*(C*u-d));
Jk=1/2*u'*A*u-b'*u;
it=1;
while it<maxiter && all(diff>espsi)
    uk = u;
    J=Jk;
    
    %calcul de uk 
    u=A\(b-C'*mu);

    %calcul de muk
    mu=max(0,mu+rho*(C*u-d));
    Jk=1/2*u'*A*u-b'*u;
    diff=[norm(u-uk,inf), abs(J-Jk)];
    it=it+1;
end

end
