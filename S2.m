function S= S2(N, theta, m , x)
    % N = # of itterations
    % theta = angle of interest
    % m = refractive index
    % x = k0*R (wavenumber * radius)
    S = zeros(size(theta));

    for n = 1:N

        pi_n = pin(n,theta);
        tau_n = taun(n,theta);

        [an, bn] = mieCoeff(n, m, x);


        S = S + ((2*n + 1) / (n*(n + 1))) .* (an.*tau_n + bn.*pi_n);
    end
    

end