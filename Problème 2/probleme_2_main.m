%%%%%%%%%% Projet Exercice 3 Probleme 2 %%%%%%%

%% Initialisation

De=10; %quand De petit, le probleme nest pas faisable
N=5;


EPS=1e-4;
rho_p=0.001;
eps_p=1e-5;
itmax=200000;

e=rand(N,1)*5; 
Q=3*eye(N)+1*diag(ones(N-1,1),1)+1*diag(ones(N-1,1),-1); %Q symetrique definie positive

%% Première résolution

C_=[ones(1,N);-ones(1,N)];
d=[De;1;-1];
%C_=[ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive 
%d=[De;1;-1;zeros(N,1)];% contraintes avec u positive
m=size(C_,1)+1;


p_0=ones(m,1);
u_0=repmat(1/N,N,1);

[u,J,p,it] = res_aux_2(e,Q,C_,d,rho_p,EPS,eps_p,itmax,p_0,u_0)
abs(u'*Q*u-De)<1e-2
abs(sum(u)-1)<1e-2
%% Evolution du nombre d'iteration en fonction de N et affichage d'un plot
itmax=5000;

listeN=2:10;
 
d=[De;1;-1];
%d=[De;1;-1;zeros(N,1)];% contraintes avec u positive
for i = 1:length(listeN)
    
    N=listeN(i);
    Q=3*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1); %Q symetrique definie positive
    %on pourrait aussi essayer Q=eye(N);
    C_=[ones(1,N);-ones(1,N)];
    %C_=[ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive 
    m=size(C_,1)+1;
    p_0=ones(m,1);
    u_0=repmat(1/N,N,1);
    it(i)=0;
    
    
    for j =1:10
        e=rand(N,1)*5;
        [~,~,~,it2] = res_aux_2(e,Q,C_,d,rho_p,EPS,eps_p,itmax,p_0,u_0);
        it(i)=it(i)+it2;
    end
    it(i)=it(i)/10;
end

% affichage
plot(listeN,it)
xlabel('N')
ylabel('Nombre d iterations')
title('Nombre moyen d iterations en fonction de N')
%% Evolution du nombre d'iteration en fonction de De et affichage d'un plot
N=5;


Q=3*eye(N)+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1); %Q symetrique definie positive

C_=[ones(1,N);-ones(1,N)];

%C_=[ones(1,N);-ones(1,N);-eye(N)]; % contraintes avec u positive 
%d=[De;1;-1;zeros(N,1)];% contraintes avec u positive
m=size(C_,1)+1;


itmax=10000;

p_0=ones(m,1);
u_0=repmat(1/N,N,1);

listeDe=6:20;
for i =1:length(listeDe)
    
    De=listeDe(i);
    d=[De;1;-1];
    it(i)=0;
    
    for j =1:10
        e=rand(N,1)*5;
        [~,~,~,it2] = res_aux_2(e,Q,C_,d,rho_p,EPS,eps_p,itmax,p_0,u_0);
        it(i)=it(i)+it2;
    end
    it(i)=it(i)/10;
end

% affichage
plot(listeDe, it)
xlabel('De')
ylabel('Nombre d iterations')
title('Nombre moyen d iterations en fonction de De')