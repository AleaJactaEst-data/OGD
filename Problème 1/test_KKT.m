function [kkt] = test_KKT(u, mu, A,b,C,d, EPS)
% test des conditions KKT
if nargin <7
    EPS=1e-2;
end
kkt=all(C*u-d<EPS) && all(mu>-EPS) && all(abs(mu.*(C*u-d))<EPS)&& all(abs(A*u-b+C'*mu)<EPS);
end

