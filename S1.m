function S= S1(N, theta)
    
    %theta = linspace(0.000001,pi,1000); 
    
    % stuff i am treating as constants for now 
    a = ones(1,N);      % used in S
    b = ones(1,N);      % used in S
    P = 1;              % used in pi and tau
    d = 1;              % used in tau

    pi_n = P ./ sin(theta);
    tau_n = P .* sin(theta)/d;  % cos/cos needed? zero and pole

    S = 0;

    for n = 1:N
        S = S + ((2*n + 1) / (n*(n + 1))) .* (a(n).*pi_n + b(n).*tau_n);
    end
    

end