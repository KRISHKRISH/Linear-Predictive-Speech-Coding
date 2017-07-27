function [] = speech_seg1(fs,seg_ms,snd )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
l=length(snd);
seg_len=seg_ms*fs/1000;
%h=(hamming(seg_len))';
rows=round(l/seg_len);
seg=zeros(rows,seg_len);
j=1;
for i=1:round(seg_len):l-seg_len;
    seg(j,:)=snd(i:i+seg_len-1);
    j=j+1;
end
%seg=seg.*(repmat(h,[rows,1]));
save speech_seg1
end

