clear;
r = linspace(0.1, 10, 1000);                   
S0 = 1;               

%Einc = [1; 0];              
Einc = [1; 1i];
%Einc = 1;
%Einc = [1; 1; 1];

k0 = WaveNumberFromWavelength(1);
Esca = ForwardScatteringEnergy(k0, r, S0, Einc);
