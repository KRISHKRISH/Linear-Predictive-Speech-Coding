function [] = speech_parm(order)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
load('speech_seg')
gamma=zeros(rows,order);
err=zeros(rows,seg_len);
variance=zeros(rows,1);
amp=zeros(rows,1);
for i=1:rows
gamma(i,:)=coeff_extract(seg(i,:),order);
[variance(i),amp(i),err(i,:)]=for_err(seg(i,:),gamma(i,:));
save ('speech_parm')
end

end

