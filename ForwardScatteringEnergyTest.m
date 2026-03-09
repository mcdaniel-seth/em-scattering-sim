%% Fwd Scattering energy test

% using wavenumberfromwavelength, ForwardScatteringEnergy
clear;
r = linspace(0.1, 10, 1000); 
%S = S1(1000,0.00001);           % 0 is undefined 
S = 1;               

%Einc = [1; 0];              
Einc = [1; 1i];
%Einc = 1;
%Einc = [1i; 12i; 1];

k0 = WaveNumberFromWavelength(1);
Esca = ForwardScatteringEnergy(k0, r, S, Einc);

    plot(r, real(Esca)) 
    xlabel('r');
    ylabel('Energy');
    title('Forward Scattering Energy vs distance');
    grid on;


%% Mie Coeff Test

% using wavenumberfromwavelength, mieCoeff, and ricattiBessel

clear; 

R = pi;
k0 = WaveNumberFromWavelength(10);
x = k0*R;
m = 1.8;

[An, Bn] = mieCoeff(10,m,x)

%% Fwd Scatter using S1 - FIXED WAVENUM

clear; 

L = 10; % reciever dist
r = linspace(0.1, L, 1000); 

particleR = L/2;

R = 0.000001;
k0 = WaveNumberFromWavelength(10);
m = 1.8;
x = k0*R;

Nmax = ceil(max(x+4*x.^(1/3) + 2)); % takes the max value it will be and 
                                    % rounds to nearest int

S = S1(Nmax,0,m,x);              

Einc = planewave(k0,particleR);

Esca = ForwardScatteringEnergy(k0, r, S, Einc); 


figure;

    
    plot(r, abs(Esca)) 
    xlabel('r');
    ylabel('Energy');
    title('Forward Scattering Energy vs distance');
    grid on;


%% Fwd Scatter using S1 - FIXED DIST

clear; 

L = 10;                 % reciever dist
r = 5;                  % dist from particle to receiver
particleR = L/2;        % dist from emitter to particle

freq = linspace(1e6, 1e9, 1000); 
%freq = linspace(1e6, 1e7, 1000); 
k0 = 2*pi*freq/3e8;                             %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c

R = 0.000000001;
m = 1.8;
x = k0*R;


Nmax = ceil(max(x+4*x.^(1/3) + 2)); % takes the max value it will be and 
                                    % rounds to nearest int

S = S1(Nmax, 0,m,x);              

Einc = planewave(k0,particleR);

Esca = ForwardScatteringEnergy(k0, r, S, Einc);

figure;

plot(freq/1e6, Esca); % plotting in MHz
%xlim([1 1000]);
xlabel('frequency (in Mhz)');
ylabel('Energy');
title('Forward Scattering Energy vs Frequency');

grid on;


%% Scattering Efficiency Test

clear;

freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;                 %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c
R = pi;
m = 1.8;
x = k0*R;


Qsca = ScatteringEfficiencyFactor(x, m);


figure;
plot(freq/1e6, Qsca); % plotting in MHz
xlim([1 1000]);
xlabel('frequency (in Mhz)');
ylabel('Qsca');
title('Scattering Efficiency Factor vs Frequency');
grid on;