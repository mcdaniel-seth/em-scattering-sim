% Forward Scattering Energy


function Esca = ForwardScatteringEnergy(k0,r,S0,Einc)
    % k0 -> wavenumber
    % r -> veiwing distance
    % S0 -> Constant for now
    % Einc -> Entering Energy (vector?)
    
    Esca = (exp(1i*k0.*r) ./ (k0.*r)) .* (S0 .* Einc(:));

    figure;
    plot(r, real(Esca).') % .' transposes Esca
    xlabel('r');
    ylabel('Eenergy');
    title('Forward Scattering Energy vs distance');
    grid on;

   
end