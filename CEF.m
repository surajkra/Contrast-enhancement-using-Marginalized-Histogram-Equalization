function [ Score ] =CEF( I,E )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
SD_I=std2(I)*std2(I);

SD_E=std2(E)*std2(E);

MU_I=mean2(I);

MU_E=mean2(E);

Score=(SD_E/MU_E)/(SD_I/MU_I);

end

