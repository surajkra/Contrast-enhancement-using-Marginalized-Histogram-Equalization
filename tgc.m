function [ T ] = tgc( Img,Gamma )
%TGC: Perform the transform Based Gamma Correction
%   Inputs: Input image and Gamma value
%   Output: Transformed Image

Hist_values=imhist(Img);

I_max=length(Hist_values);

for count=1:size(Hist_values,1)
    T_func(count)=I_max*((count/double(I_max))^Gamma);
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

