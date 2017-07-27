function [v,amp,err] = for_err(snd,gama_vect)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

g_N=length(gama_vect);
err=[];
N=length(snd);
b=zeros(2,g_N+1);
for i=1:N
    e=snd(i);
    b(mod(i,2)+1,1)=e;
    for j=1:g_N
        [e,b(mod(i,2)+1,j+1)]=for_lattice_str(gama_vect(j),e,b(mod(i+1,2)+1,j));    
    end
    err=[err,e];
end
%figure;
%plot(xcorr(err,err)/length(err),'r');
v=var(err);
amp=max(err);
end

