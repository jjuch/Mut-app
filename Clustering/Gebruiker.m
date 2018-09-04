classdef Gebruiker
   properties
      Name % cell array of names [string 
      Specs % cell array of [1xk] parameters
      Clus % cell array of [1x1] number of subgroup (max. n)
   end
   methods
      function r=show(obj,index)
         disp(strcat('Name: ',obj.Name{index}));
         disp('Specs: ');disp(obj.Specs{index});
      end %show
      function C=Cluster(obj,ClusterMatrix)
          for i=1:length(obj.Name)
             temp=obj.Specs{i}*ClusterMatrix;
             [maxim,C{i}]=max(temp);
          end %for i
      end %Cluster
      function Q=GiveClusters(obj)
          Q=[];
          for i=1:length(obj.Name)
              Q=[Q;obj.Clus{i}];
          end %for i
      end %GiveClusters
   end
end