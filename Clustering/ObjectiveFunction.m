function [ cost ] = ObjectiveFunction( Clusters )
%OBJECTIVEFUNCTION This function associates a cost to the current cluster
%situation. This cost is in proportion with the amount of people per
%cluster.

%Initialize cost
cost=10^3;
%Initialize bins - contains the number of people in the cluster
bins=zeros(1,4);

%Count the number of people in every bin
for i=1:length(Clusters)
    bins(Clusters(i))=bins(Clusters(i))+1;
end %for i

%Calculate standard deviation - if 0 all groups are equal in size
if cost>std(bins)
    cost=std(bins);
end %fi

end

