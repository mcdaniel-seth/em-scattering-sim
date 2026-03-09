
function Qsca = ScatteringEfficiencyFactor(x, m)
    % x = k0*R
    % m = refractive index
    % Nmax = # of itterations

    x = x(:).';
    
    Qsca = zeros(size(x));
    
    for j = 1: length(x)

        Nmax = ceil(x(j)+4*x(j).^(1/3) + 2) + 20; 
        Qscaj = 0;

        for n = 1 :Nmax
            [an, bn] = mieCoeff(n, m , x(j));
            Qscaj = Qscaj + (2*n + 1) * (abs(an)^2 + abs(bn)^2);
        end

        Qsca(j) = (2/x(j)^2) * Qscaj;

    end


end