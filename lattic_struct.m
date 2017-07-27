%noise=wgn(1,256,2);
%noise=noise-mean(noise);
h=[1,zeros(1,256)];
N=length(h);
g_N=length(gama_vect);
r=zeros(1,g_N+1);
y=zeros(1,N);
for i=1:N
    e=h(i);
    for j=g_N:-1:1
        [e,r(j+1)]=lattice_structure(gama_vect(j),e,r(j));    
    end
    y(i)=e;
    r(1)=e;
end
figure;
plot(abs(fft(y)),'r');
title('approx' )