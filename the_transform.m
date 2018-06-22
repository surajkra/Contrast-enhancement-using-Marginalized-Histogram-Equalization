function [ Return_T ] = the_transform( p_d_f )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here


for count=1:length(p_d_f)
   c_d_f(count)=0;
    for k=1:count
        c_d_f(count)=c_d_f(count)+p_d_f(k,2);
    end
end

max_c_d_f=(max(c_d_f));
min_c_d_f=(min(c_d_f));
c_d_f=(c_d_f-min_c_d_f)/(max_c_d_f-min_c_d_f);


I_max=max(max(p_d_f(:,1)));

for count=1:size(p_d_f,1)
    T(count)=c_d_f(count)*I_max(1);
end

Return_T(:,1)=p_d_f(:,1);
Return_T(:,2)=T;
end

