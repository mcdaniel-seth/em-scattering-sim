
function pi_n = pin(n,theta)
% n = index
% theta angle input
    P = legendre(n, cos(theta));
    Pm1 = P(2,:);                    % always m = 1
    pi_n = Pm1 ./ sin(theta);

end