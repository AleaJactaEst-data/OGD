%%%%%%%%%%%%%%%%% Projet Exercice 3 : Problème 1 %%%%%%%%%%
%% Initialisation
N = 10;
e = 5*rand(N,1);
b = zeros(N,1);


% Parametre de la decomposition : 
EPS=1e-5;
rho_p=0.001;
eps_p=1e-7;
itmax=1000;


% initialisation de u0 et p0
u_0=repmat(1/N,N,1);


%% Probleme 1 avec Re =1 sans covariance : 
Re = 1;

Q = eye(N);

C = [-e';ones(1,N);-ones(1,N)];
m = size(C,1);
d = [-Re;1;-1];

% Resolution du probleme pour Q diagonale donc pas de covariance / donc indépendance : 
[ u1,J1 ,mu1,it1] = Uzawa_quad( Q,b,C,d,0.001,rand(size(C,1),1), 1e-12,10000);
[kkt] = test_KKT(u1, mu1, Q,b,C,d,1e-2) % kkt est verifie


p_0=zeros(m,1);

% Probleme auxiliaire par le prix :
[u2,J2,~,it2] = res_aux_1(Q,b,C,d,rho_p,EPS,eps_p,itmax,p_0,u_0,true); % kkt est verifie
err=norm(u1-u2,inf) % on a presque une egalite des deux solutions

%% Probleme 1 avec Re = 5 avec covariance :
Re=4;

Q=3*eye(N)+1*diag(ones(N-1,1),1)+1*diag(ones(N-1,1),-1); %Q symetrique definie positive

C=[-e';ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive
d=[-Re;1;-1;zeros(N,1)];% contraintes avec u positive
m=size(C,1);



p_0=zeros(m,1);

[u2,J2,~,it2] = res_aux_1(Q,b,C,d,rho_p,EPS,eps_p,itmax,p_0,u_0,true); % kkt verifiee, uzawa ne pourrait pas resoudre ce probleme

%% Test du nombre moyen d'iteration en fonction de N   : 

Re=2;
listeN=2:20;

for i=1:length(listeN)
    N=listeN(i);
    Q=3*eye(N)+1*diag(ones(N-1,1),1)+1*diag(ones(N-1,1),-1); %Q symetrique definie positive
    it(i)=0;
    for j=1:5
        % initialisation
        e=rand(N,1)*5;
        b=zeros(N,1);
        C=[-e';ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive
        d=[-Re;1;-1;zeros(N,1)];% contraintes avec u positive
        m=size(C,1);
        p_0=zeros(m,1);
        u_0=repmat(1/N,N,1);
        
        % resolution
        [~,~,~,it2] = res_aux_1(Q,b,C,d,rho_p,EPS,eps_p,itmax,p_0,u_0,true);
        it(i)=it(i)+it2;
        
    end
    it(i)=it(i)/5;

end

% affichage
figure;
plot(listeN,it)
title('Nombre moyen d''itérations en fonction de N')
xlabel('N')
ylabel('Nombre itérations')
%% Test du nombre d'iteration en fonction de Re
clear it
N=10;
listeRe=0:0.2:4.4;
Q=3*eye(N)+1*diag(ones(N-1,1),1)+1*diag(ones(N-1,1),-1); %Q symetrique definie positive

for i=1:length(listeRe)

    Re=listeRe(i);
    it(i)=0;
    for j=1:10
        
        %initialisation
        e=rand(N,1)*5;
        b=zeros(N,1);
        C=[-e';ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive
        d=[-Re;1;-1;zeros(N,1)];% contraintes avec u positive
        m=size(C,1);
        p_0=zeros(m,1);
        u_0=repmat(1/N,N,1);
        
        % resolution
        [~,~,~,it2] = res_aux_1(Q,b,C,d,rho_p,EPS,eps_p,itmax,p_0,u_0,true);
        it(i)=it(i)+it2;
    end
    it(i)=it(i)/10;

end

% affichage
figure;
plot(listeRe,it)
title('Nombre moyen d''itérations en fonction de Re')
xlabel('Re')
ylabel('Nombre itérations')