function [ cost ] = ObjectiveFunction( change )
%OBJECTIVEFUNCTION This function associates a cost to the current cluster
%situation. This cost is in proportion with the amount of people per
%cluster.

%Use the global Gebruiker set.
global G M;

%'change' enters as an vector of n*k values and has to be converted to a
%matrix with [n,k] as dimension
M_add=vec2mat(change,4);


%The M vector is defined in the TestOptimalisatie.m and is given here as well as clarification:
% M=[1 2 3 4 5; 5 1 2 3 4; 4 5 1 2 3; 3 4 5 1 2]'; A new M vector is made
% that can lead to an optimized output.
M_new=M+M_add;

%The clusters are updated with the new M matrix.
G.Clus=Cluster(G,M_new);

%The Clusters are listed of each user.
Clusters=GiveClusters(G);

%Initialize bins - contains the number of people in the cluster
bins=zeros(1,4);

%Count the number of people in every bin
for i=1:length(Clusters)
    bins(Clusters(i))=bins(Clusters(i))+1;
end %for i
%bins

%Calculate standard deviation - if 0 all groups are equal in size
cost=std(bins);

end

