function [kkt] = test_KKT(u, mu, A,b,C,d, EPS)
% test des conditions KKT

% gestion de la fonction si EPS n'est pas donnee
if nargin <7
    EPS=1e-2;
end

% donne le critere KKT comme vu dans les TP
kkt=all(C*u-d<EPS) && all(mu>-EPS) && all(abs(mu.*(C*u-d))<EPS)&& all(abs(A*u-b+C'*mu)<EPS);
end

