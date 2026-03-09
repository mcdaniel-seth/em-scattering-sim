function Einc = planewave(k0, r)
% creates a plane wave for Eninc
% k0 = wavenumber
% r = veiwing distance

% Einc = E0*p*exp(i*k*r)
% in our case, not wanting E0 
                                        
    Einc = exp(1i * k0 .* r);
    

    % For now we only are wanting a single row matrix so VVV unneeded

    % EincVector = [ex ; zeros(size(ex)) ; zeros(size(ex)) ];
    % Einc = EincVector(1,:);

end