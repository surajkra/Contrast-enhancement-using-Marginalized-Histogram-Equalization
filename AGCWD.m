function [ T ] = AGCWD( Img,alpha )
%the: Perform the traditional histogram equalization
%   Inputs: Input Image, alpha
%   Output: Transformed Image

Hist_values=imhist(Img);

p_d_f=Hist_values/(size(Img,1)*size(Img,2));

p_d_f=double(p_d_f);

for l=1:size(Hist_values,1)
p_d_f_w(l)=max(p_d_f)*((p_d_f(l)-min(p_d_f))/(max(p_d_f)-min(p_d_f)))^alpha;
end 

p_d_f_sum=sum(p_d_f_w);

for count=1:length(p_d_f)
   c_d_f_w(count)=0;
    for k=1:count
        c_d_f_w(count)=c_d_f_w(count)+(double(p_d_f_w(k))/p_d_f_sum);
    end
end

I_max=length(p_d_f);

for count=1:size(Hist_values,1)
    T_func(count)=I_max*((count/double(I_max))^(1-c_d_f_w(count)));
end

for x=1:size(Img,1)
    for y=1:size(Img,2)
        for count=1:size(Hist_values,1)
            if(Img(x,y)== count)
                T(x,y)=T_func(count);
            end
        end
    end
end




end

