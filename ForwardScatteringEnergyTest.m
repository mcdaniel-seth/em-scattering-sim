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


S = S1(0,m,x);              

Einc = planewave(k0,particleR);

Esca = ForwardScatteringEnergy(k0, r, S, Einc); 


figure;

    
    plot(r, Esca) 
    xlabel('r');
    ylabel('Energy');
    title('Forward Scattering Energy vs distance');
    grid on;


%% Fwd Scatter using S1 - FIXED DIST

%clear; 

L = 0.02;                 % reciever dist
r = 5;                  % dist from particle to receiver
particleR = L/2;        % dist from emitter to particle

freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c

R = 1*10^-6;
m = 1.8;
x = k0*R;



S = S1(0,m,x);              

Einc = planewave(k0,particleR);

Esca1 = ForwardScatteringEnergy(k0, particleR, S, Einc);

figure;

plot(freq/1e6, abs(Esca1)); % plotting in MHz
xlabel('frequency (in Mhz)');
ylabel('Energy');
title('Forward Scattering Energy vs Frequency');

grid on;


%% Scattering Efficiency Test

clear;

freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;                 %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c
R = 1*10^-6;
m = 1.8;
x = k0*R;


Qsca = ScatteringEfficiencyFactor(x, m);


figure;
plot(freq/1e6, abs(Qsca)); % plotting in MHz
xlim([1 1000]);
xlabel('frequency (in Mhz)');
ylabel('Qsca');
title('Scattering Efficiency Factor vs Frequency');
grid on;

%% Fwd Scatter MULITPLE PARTICLEs

%clear; 

L = 0.02;                 % reciever dist
%particleR = L/2;        % dist from emitter to particle

freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c

R = 1e-6;
m = 1.8;
x = k0*R;

N =((0.0001*(0.01*0.01*0.02))/(pi*R^2)); % Num of particles

S = S1(0,m,x);              


Esca_sum = zeros(size(freq));
for n = 1:N

    particleR = rand()*L;

    Einc = planewave(k0, particleR); 
    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);
    
    Esca_sum = Esca_sum + Esca;
end
figure;

plot(freq/1e6, abs(Esca_sum)); % plotting in MHz
xlabel('frequency (in Mhz)');
ylabel('Energy');
title('Forward Scattering Energy vs Frequency with Multiple Particles');

grid on;

%% Plot diff of Multiple Esca - Single Esca

% Must run FIXED DIST section then MULTIPLE PARTICLES section first

plot(freq/1e6, abs(Esca_sum)-abs(Esca1)); % plotting in MHz
xlabel('frequency (in Mhz)');
ylabel('Energy');
title('Diff Multiple - Single');

grid on;

%% DIFF Particle Sizes

clear; 

L = 0.02;                 % reciever dist
freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c
m = 1.8;


R = 1e-9; % CHANGE ME (radius of particle in m)


x = k0*R;

%N =((0.0001*(0.01*0.01*0.02))/(pi*R^2)); % Num of particles
                                         % R = 1e-6 -> N=63
                                         % R = 1e-5 -> N=.67
N =((0.0001*(0.01*0.01*0.02))/(pi*(1e-6)^2)); % so using this hardcoded R

S = S1(0,m,x);              


Esca_sum = zeros(size(freq));
for n = 1:N

    particleR = rand()*L;

    Einc = planewave(k0, particleR); 
    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);
    
    Esca_sum = Esca_sum + Esca;
end
figure;

plot(freq/1e6, abs(Esca_sum)); % plotting in MHz
xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['R =  ',num2str(R)]);

grid on;