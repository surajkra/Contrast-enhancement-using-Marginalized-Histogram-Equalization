% These codes are written by Prof. Jayanta Mukherjee, IIT Kharagpur
% during his visit to Univ. of Southern California during July'2007 to 
% Dec.'2007. The codes may be used freely for any academic and research 
% purpose. 



function score = colourfulness_metric(img)

%========================================================================
%implementation from "color Image Quality on the Internet", by S. Susstrunk
%and S. Winkler, Proc. of IS&T / SPIE Electronic Imgaing 2004: Internet
%Imaging V, vol. 5304, pp. 118-131, 2004.
% Image should be in RGB space
%========================================================================

if (nargin > 1) % Number of input argument
    score = -1;
    return;
end

[M N d] = size(img);

if(d~=3)
    sprintf('Not a color image')
    score=-1;
    return
end

   
x = double(img);
R=x(:,:,1);
G=x(:,:,2);
B=x(:,:,3);

alpha= R-G;
beta=(R+G)/2-B;

sigma_a=std2(alpha);
sigma_b=std2(beta);
mu_a=mean2(alpha);
mu_b=mean2(beta);

score=sqrt(sigma_a*sigma_a+sigma_b*sigma_b)+0.3*sqrt(mu_a*mu_a+mu_b*mu_b);

return
