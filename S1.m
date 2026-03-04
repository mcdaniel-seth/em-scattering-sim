function S= S1(N, theta, m , x)
% N = # of itterations
% theta = angle of interest
% m = refractive index
% x = k0*R (wavenumber * radius)
S = zeros(size(x));
x = x(:).';

for j = 1: length(x)
    Sj= 0;
    Nmax = ceil(x(j) + 4*x(j)^(1/3) + 2);
   for n = 1:Nmax
       pi_n = pin(n,theta);
  
       tau_n = taun(n,theta);
  
       [an, bn] = mieCoeff(n, m, x(j));
  
       Sj = Sj + ((2*n + 1) / (n*(n + 1))) .* (an.*pi_n + bn.*tau_n);
   end
   S(j) = Sj;
end
end

