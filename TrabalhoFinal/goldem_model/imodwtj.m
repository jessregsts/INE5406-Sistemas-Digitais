function [Vout] = imodwtj(Win,Vin,g,h,j)

M = length(Vin);
L = length(h);


Vout = repmat(NaN, [M, 1]);

for t = 1: M
  u = t;
 
  Vout(t) = (h(1)*Win(u)) + (g(1) * Vin(u));

  for (n = 2:L)
    u = u + ((2^(j-1)));
    if (u > M)
      u = 1;
    end
    Vout(t) = Vout(t) +(h(n) * Win(u)) +(g(n) * Vin(u));
  end
end

return