function [ak] = dft1(a)
%a = [1 2 3 4];
L = length(a);
ak = zeros(1,L);
for k =(1:L)
    for n =(1:L)
        ak(k) = ak(k) + a(n) * exp((-i * 2* pi * k *n) / L);
    end;
end;