tic
close all
N = 100;
t = -N:0.01:N;
y = 0;
z = 0;
fs = 2.5;
Ts = 1/fs;
for i = 0:2*N
    y = y + (3*cos(2*pi*(-N+i)*Ts)*cos(pi*(-N+i)*Ts/2))*sinc(fs*(t-(N-i)*Ts));
    z = z + cos(pi*(-N+i)*Ts);
end
%subplot(3,1,1);
%plot(t,z);
s = (2*cos(2*pi*t).*cos(pi*t/2));
%y = y*s(1001)/y(1001);
% s = s*y(1001)/s(1001);

subplot(2,1,1);plot(t,y,'r',t,s,'g'); axis([-5 5 -3 3]);
subplot(2,1,2);plot(t,y,'r',t,s,'g'); 
toc