%% tau_n function
function tau_n = taun(n, theta)
% n = index
% theta angle input
% we find Legendre slope at cos(theta) then multiply by -sin(theta)

cthetapos = cos(theta) + 1e-10;
cthetaneg = cos(theta) - 1e-10;


if ( cthetapos > 1 ) cthetapos  = 1;end             % cutoff for legendre
if ( cthetaneg < -1 ) cthetaneg = -1; end

Lpos = legendre(n,cthetapos);
Lneg = legendre(n,cthetaneg);

Pposm1 = Lpos(2,:);         % always m = 1
Pnegm1 = Lneg(2,:);

dP = (Pposm1 - Pnegm1) / (2e-10);


tau_n = -sin(theta) .* dP;


end