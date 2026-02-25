%% Fwd Scattering energy test

% using wavenumberfromwavelength, ForwardScatteringEnergy
clear;
r = linspace(0.1, 10, 1000); 
%S = S1(1000,0.00001);           % 0 is undefined 
S = 1;               

%Einc = [1; 0];              
%Einc = [1; 1i];
%Einc = 1;
Einc = [1i; 12i; 1];

k0 = WaveNumberFromWavelength(1);
Esca = ForwardScatteringEnergy(k0, r, S, Einc);

%% Mie Coeff Test

% using wavenumberfromwavelength, mieCoeff, and ricattiBessel

clear; 

R = pi;
k0 = WaveNumberFromWavelength(10);
x = k0*R;
m = 1.8;

[An, Bn] = mieCoeff(10,m,x)

%% Fwd Scatter using S1

clear; 

r = linspace(0.1, 10, 1000); 

R = pi;
k0 = WaveNumberFromWavelength(10);
m = 1.8;
x = k0*R;

Nmax = x+4*x^(1/3) + 2;


S = S1(Nmax,0.000001,m,x);        % what to do here? taun and pin are undefined at 0 and 1
%S = S2(Nmax,0.000001,m,x);         % pin has / by sin(theta)

Einc = planewave(k0,r);

Esca = ForwardScatteringEnergy(k0, r, S, Einc);

