function [ New_Img ] = Suraj_Method1( Img,n )
%Suraj_Method1 Summary of this function goes here
%   Detailed explanation goes here

Hist_values=imhist(Img)/(size(Img,1)*size(Img,2));

Hist_Matrix=zeros(length(Hist_values),2);

for count=1:length(Hist_values)
    Hist_Matrix(count,1)=count;
    Hist_Matrix(count,2)=Hist_values(count);
end
%%
Hist_Matrix=sortrows(Hist_Matrix,2);
Size_Cluster=ceil(length(Hist_values)/n);
% Hist_Cluster=zeros(Size_Cluster,2,n);
Cluster_Weight=zeros(n,1);
Cluster_Counters=ones(n,1);

Zero_Count=find(Hist_Matrix(:,2)==0);
Zero_Split=ceil(length(Zero_Count)/n);

for count=1:length(Zero_Count)
    Cluster_select=min(find(Cluster_Counters==min(Cluster_Counters)));
    Hist_Cluster(Cluster_Counters(Cluster_select),1,Cluster_select)=Hist_Matrix(count,1);
    Hist_Cluster(Cluster_Counters(Cluster_select),2,Cluster_select)=Hist_Matrix(count,2);
    Cluster_Counters(Cluster_select)=Cluster_Counters(Cluster_select)+1;
end

for count=size(Hist_Matrix,1):-1:1
    if(Hist_Matrix(count,2)>0)
    Cluster_select=min(find(Cluster_Weight==min(Cluster_Weight)));
    Hist_Cluster(Cluster_Counters(Cluster_select),1,Cluster_select)=Hist_Matrix(count,1);
    Hist_Cluster(Cluster_Counters(Cluster_select),2,Cluster_select)=Hist_Matrix(count,2);
    Cluster_Weight(Cluster_select)=sum(Hist_Cluster(:,2,Cluster_select));
    Cluster_Counters(Cluster_select)=Cluster_Counters(Cluster_select)+1;
    end
end

for Cluster_select=1:n
    Hist_temp= Hist_Cluster(:,:,Cluster_select);
    Hist_temp=sortrows(Hist_temp,1);
    Hist_Cluster(:,:,Cluster_select)=Hist_temp;
end
%%
New_Hist=[];
for Cluster_select=1:n
T=the_transform(Hist_Cluster(:,:,Cluster_select));
New_Hist=[New_Hist' T'];
New_Hist=New_Hist';
end
%%
New_Hist=sortrows(New_Hist,1);
% figure();
% stem(New_Hist(:,1),New_Hist(:,2));
% figure();
% imhist(Img);
A=min(find(New_Hist(:,1)>0));
New_Hist=New_Hist(A:end,:);
for x=1:size(Img,1)
    for y=1:size(Img,2)
        for count=1:size(New_Hist,1)
            if(Img(x,y)== count)
                New_Img(x,y)=New_Hist(count,2);
            end
        end
    end
end
T=0;



end

