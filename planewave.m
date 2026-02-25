function Einc = planewave(k0, r)
% creates a plane wave for Eninc
% k0 = wavenumber
% r = veiwing distance

% Einc = E0*p*exp(i*k*r)
% in our case, not wanting E0 
                                        % p is polarization, polarized in x
                                        % only?

    Einc = [exp(1i * k0 * r) ; zeros(size(r)) ; zeros(size(r)) ];

end