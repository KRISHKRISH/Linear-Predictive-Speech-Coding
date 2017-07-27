function [gama_vect] = coeff_extract(snd,order)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fil_cor=xcorr(snd)/length(snd);
c=(length(fil_cor)-1)/2+1;
a1=-fil_cor(c+1)/fil_cor(c);
gama_vect=a1;
gap=conv(fil_cor,[1,a1']);
for i=2:order
    gamma=-gap(c+i)/gap(c);
gama_vect=[gama_vect;gamma];
k=i:length(gap);
gap(k)=gap(k)+gamma*gap(length(gap)-k + i);
end
gama_vect=-gama_vect;
end

