
function [an, bn] = mieCoeff(n, m, x)

    % Function returns the Mie coeffciants An and Bn
    % needs ricattiBessel function
    %
    % n = which iteration (Bohren and Huffman use Nmax = x+4*x^(1/3) + 2)
    % m = refractive index
    % x = k0*R (wavenumber * radius)

                                        % must eval ricatiiBessel at both x
                                        % and mx for eqns

    [psi_x, xi_x, dpsi_x, dxi_x] = riccatiBessel(n,x);

    [psi_mx, xi_mx, dpsi_mx, dxi_mx] = riccatiBessel(n, m*x);
    
    an = (m*psi_mx*dpsi_x - dpsi_mx*psi_x) / (m*psi_mx*dxi_x - dpsi_mx*xi_x);

    bn = (psi_mx*dpsi_x - m*dpsi_mx*psi_x) / (psi_mx*dxi_x - m*dpsi_mx*xi_x);


end