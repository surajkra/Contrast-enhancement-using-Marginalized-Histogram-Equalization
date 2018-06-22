function [ T ] = the( Img )
%the: Perform the traditional histogram equalization
%   Inputs: Input Image
%   Output: Transformed Image

Hist_values=imhist(Img);

p_d_f=Hist_values/(size(Img,1)*size(Img,2));

for count=1:length(p_d_f)
   c_d_f(count)=0;
    for k=1:count
        c_d_f(count)=c_d_f(count)+p_d_f(k);
    end
end

I_max=size(p_d_f,1);

for count=1:size(Hist_values,1)
    T_func(count)=c_d_f(count)*I_max;
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

