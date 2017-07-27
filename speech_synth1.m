function [synth ] = speech_synth1()
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
load ('speech_parm1')
close all
synth=zeros(1,round(rows*seg_len));
synth_ov=zeros(1,round(rows*seg_len/2)+1);
for i=1:rows-1
    y=iir_lattice(variance(i),amp(i),seg_len,gamma(i,:));
    synth_ov((i-1)*round(seg_len/2)+1:(i-1)*round(seg_len/2)+seg_len)=y;
    %synth=synth+synth_ov;
    %synth_ov(:)=0;
end
synth=synth_ov-mean(synth_ov);
soundsc(synth,fs);
plot((1:length(synth))*fs/length(synth),abs(fft(synth)))
hold on
plot((1:length(snd))*fs/length(snd),abs(fft(snd)))
end

