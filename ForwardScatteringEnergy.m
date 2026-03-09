% Forward Scattering Energy
 

function Esca = ForwardScatteringEnergy(k0,r,S0,Einc)
    k0 = k0(:).';       %wavenumber    (1 x N)        % (:) forces single column
    r = r;              %veiwing distance      % .' turns to row
    S0 = S0(:).';       %Constant for now      % this makes everything a single row matrix for el by el operators
    Einc = Einc(:).';   %Incident Feild
    
    %disp([size(k0); size(r); size(S0); size(Einc)])


    Esca = (exp(1i*k0.*r) ./ (k0.*r)) .* (S0 .* Einc);

end