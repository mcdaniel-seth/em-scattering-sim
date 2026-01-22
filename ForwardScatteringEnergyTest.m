clear;
r = linspace(0.1, 10, 1000);   
k0 = 2*pi;                  
S0 = 1;               

%Einc = [1; 0];              
Einc = [1; 1i];

Esca = ForwardScatteringEnergy(k0, r, S0, Einc);
