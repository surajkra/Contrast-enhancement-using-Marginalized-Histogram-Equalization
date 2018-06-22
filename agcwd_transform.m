function [ Return_T ] = agcwd_transform( p_d_f,alpha )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
p_d_f=double(p_d_f);

for l=1:length(p_d_f)
p_d_f_w(l)=max(p_d_f(:,2))*(((p_d_f(l,2)-min(p_d_f(:,2))))/(max(p_d_f(:,2))-min(p_d_f(:,2))))^alpha;
end 

p_d_f_sum=sum(p_d_f_w);

for count=1:length(p_d_f)
   c_d_f_w(count)=0;
    for k=1:count
        c_d_f_w(count)=c_d_f_w(count)+(double(p_d_f_w(k))/p_d_f_sum);
    end
end

I_max=max(max(p_d_f(:,1)));

for count=1:length(p_d_f)
    T_func(count)=I_max*((count/double(I_max))^(1-c_d_f_w(count)));
end

Return_T(:,1)=p_d_f(:,1);
Return_T(:,2)=T_func;
end

