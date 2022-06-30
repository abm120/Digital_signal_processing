clc;
clear all;
pb=input('Enter the pass band frequency ');
sb=input('Enter the stop band frequency ');
pbr=input('Enter the pass band attenuation ');
sbr=input('Enter the stop band attenuation ');
fs=input('Enter the sampling frequency ');
T= 1/fs;
wp=pb*2*pi/(fs);
ws=sb*2*pi/(fs);
pbrad=2*tan(wp/2)/T;
sbrad=2*tan(ws/2)/T;
[n,wn]=buttord(pbrad,sbrad,pbr,sbr,'s');
[b,a]=butter(n,wn,'s');
[z,p,k]=tf2zp(b,a);
[zd,pd,kd]=bilinear(z,p,k,fs);
[num,den]=zp2tf(zd,pd,kd);
figure(1);
freqz(num,den,512,fs);
title('butterworth Frequency Response ');
[n,wn]=cheb1ord(pbrad,sbrad,pbr,sbr,'s');
[b,a]=cheby1(n,pbr,wn,'s');
[z,p,k]=tf2zp(b,a);
[zd,pd,kd]=bilinear(z,p,k,fs);
[num,den]=zp2tf(zd,pd,kd);
figure(2);
freqz(num,den,512,fs);
title('chebychev1 Frequency Response ');
[n,wn]=cheb2ord(pbrad,sbrad,pbr,sbr,'s');
[b,a]=cheby2(n,pbr,wn,'s');
[z,p,k]=tf2zp(b,a);
[zd,pd,kd]=bilinear(z,p,k,fs);
[num,den]=zp2tf(zd,pd,kd);
figure(3);
freqz(num,den,512,fs);
title('chebychev2 frequency Response ');