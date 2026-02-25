
function [psi, xi, dpsi, dxi] = riccatiBessel(n, z)

    % Function returns the bessel functions needed for the coeff An and Bn
    %   (used in mieCoeff.m)
    % n = which iteration (Bohren and Huffman use Nmax = x+4*x^(1/3) + 2)
    % z = either k0*R or m*k0*R
    % illiad - paper library

    n_sphere = n +.5;

    A = sqrt(pi./(2*z)); % (first part of RicBessel)  
    
    Jn = besselj(n_sphere,z); 
    Yn = bessely(n_sphere,z);

    jn = A.* Jn;       % Convert the bessel func to spherical (Matzler (4.9))  
    yn = A .* Yn;
    hn = jn + 1i*yn;                               

    psi = z .* jn;                               
    xi = z .*hn;
    
    dA = -0.5 .* A ./z;

    dJn = 0.5 .* (besselj(n_sphere-1,z) - besselj(n_sphere+1,z));
    dYn = 0.5 .* (bessely(n_sphere-1,z) - bessely(n_sphere+1,z));
    
    % d A*Jn = dA*Jn + A*dJn

    djn = dA .* Jn + A .* dJn;              % product rule
    dyn = dA .* Yn + A .* dYn;

    dhn = djn + 1i*dyn;  % (Matzler (4.10)) 


    
    dpsi = jn + z .* djn;                           % product rule
    dxi = hn + z .* dhn;


end
