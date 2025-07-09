function [Vout, Wout] = modwtj(Vin,g,h,j)

M = (length(Vin));
L = length(h);

Wout = zeros(1,M);
Vout = zeros(1,M);

for t = 1: M
  u = t;
  Wout(t) = h(1) * Vin(t);
  Vout(t) = g(1) * Vin(t);

  for (n = 2:L)
    u = u - ((2^(j-1)));
    if (u < 1)
      u = M;
    end
    Wout(t) = Wout(t) +( h(n) * Vin(u));
    Vout(t) = Vout(t) +( g(n) * Vin(u));
  end
end

return