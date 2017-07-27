function [y] = iir_lattice(v,amp,N,gama_vect,Noise,h)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
noise=wgn(1,N,10*log10(2*2.5266*v));
%noise=wgn(1,N,10*log10(v));
noise=noise-mean(noise);
%noise=Noise*v/var(Noise);
%noise=noise-mean(noise);
%noise=  amp*(noise/max(noise));
%noise=[1,zeros(1,N-1)];
noise=noise.*h;
%noise=Noise;
g_N=length(gama_vect);
r=zeros(1,g_N+1);
y=zeros(1,N);
for i=1:N
    e=noise(i);
    for j=g_N:-1:1
        [e,r(j+1)]=lattice_structure(gama_vect(j),e,r(j));    
    end
    y(i)=e;
    r(1)=e;
end
%figure;
%y=1.2*y/(100*max(y));
%plot(abs(fft(y)),'r');
%hold on
%title('approx' )
end

