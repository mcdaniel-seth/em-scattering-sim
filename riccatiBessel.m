
function [psi, xi, dpsi, dxi] = riccatiBessel(n, x)

    % Function returns the bessel functions needed for the coeff An and Bn
    %
    % n = which iteration (Bohren and Huffman use Nmax = x+4*x^(1/3) + 2)
    % x = either k0*R or m*k0*R

    syms z

    jn = sqrt(pi./(2*z)) .* besselj(n+0.5,z);       % Convert the bessel func to spherical (Matzler pg.3)
    
    yn = sqrt(pi./(2*z)) .* bessely(n+0.5,z);
    
    hn = jn + 1i*yn;                                % hankel?

    psi_sym = z * jn;                               % using syms to find derivative (Matzler does recursion?)

    xi_sym = z*hn;

    dpsi_sym = diff(psi_sym,z);

    dxi_sym = diff(xi_sym, z);
    
    psi = double(subs(psi_sym, z, x));              
    xi = double(subs(xi_sym, z, x));
    dpsi = double(subs(dpsi_sym, z, x));
    dxi = double(subs(dxi_sym, z, x));


end
