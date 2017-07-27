function [synth ] = speech_synth()
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
load ('speech_parm')
%close all
synth=zeros(1,round(rows*seg_len/2)+1);
synth_ov=zeros(1,round(rows*seg_len/2)+1);
cor=zeros(1,rows);
for i=1:rows-1
    y=iir_lattice(variance(i),amp(i),seg_len,gamma(i,:),err(i,:),h);
    y=y.*h;
    cor(i)=max(xcorr(y,seg(i,:)))/sqrt(var(y)*var(seg(i,:)));
    
   synth_ov((i-1)*round(seg_len/2)+1:(i-1)*round(seg_len/2)+seg_len)=y;
    synth=synth+synth_ov;
    synth_ov(:)=0;
end
synth=synth-mean(synth);
soundsc(2*synth,fs);
plot((1:length(synth))*fs/length(synth),abs(fft(synth)))
hold on
plot((1:length(synth))*fs/length(synth),abs(fft(snd(1:length(synth)))))
figure;
plot(synth)
hold on
plot(snd)
figure;
plot(cor)
end

