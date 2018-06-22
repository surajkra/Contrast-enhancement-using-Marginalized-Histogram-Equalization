function [ T ] = Geometric( Img )

Hist_values=imhist(Img);

p_d_f=Hist_values/(size(Img,1)*size(Img,2));

NZ=find(p_d_f>0);

Initial_split=ceil((max(NZ)-min(NZ))/2);

 T_func=the_transform(p_d_f(1:Initial_split));
 temp=the_transform(p_d_f(Initial_split:end));
 T_func=[T_func temp];
T=0;
end



