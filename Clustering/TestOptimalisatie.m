clear all;
close all;
clc;
%% Generate random set of users (size m) with n question answers

m=50; % Aantal Gebruikers %length(G.Name);
k=5; % Aantal parameters
n=4;    % Aantal subgroepen
G=Gebruiker;
for i=1:8
    G.Name{i}=genvarname(strcat('G',num2str(i)));
    G.Specs{i}=rand(1,k);
end % for
show(G,2);
%%
rng('default');
rng(1);
%M=randi(10,k,n);
M=[1 2 3 4 5; 5 1 2 3 4; 4 5 1 2 3; 3 4 5 1 2]';

G.Specs{2}*M
G.Clus=Cluster(G,M);

G.Clus{2} %Cluster number (highest value)
%% Optimalisatie: Groepen even groot vs Even veel mannen als vrouwen in elke groep
% M is een vaste matrix die grootte order weergeeft tussen clusters en
% vragen. Een kleine variatie wordt toegelaten op hoofmatrix (dynamisch)
% met optimalisatie i.e. PSO

ar=GiveClusters(G)
lb=-1*ones(k,n);
ub=1*ones(k,n);
%fun = @(x) 
x=particleswarm(@ObjectiveFunction,nvars,lb,ub);