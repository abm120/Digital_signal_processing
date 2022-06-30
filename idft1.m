function [an] = idft1(bk)
%bk = [(2.0000+2.0000i) (2.0000+0.0000i) (2.0000-2.0000i) (10.0000+0.0000i)];
L1 = length(bk);
an = zeros(1,L1);
for n1 =(1:L1)
    for k1 =(1:L1)
        an(n1) = an(n1) + bk(k1) * exp((i * 2* pi * k1 *n1) / L1);
    end;
    an(n1) = an(n1)/L1;
end;