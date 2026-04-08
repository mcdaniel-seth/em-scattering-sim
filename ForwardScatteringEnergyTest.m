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

%% Single Particle - FIXED WAVENUM

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

    
    plot(r, abs(Esca)) 
    xlabel('r');
    ylabel('Energy');
    title('Forward Scattering Energy vs distance');
    grid on;


%% Single Particle - FIXED DIST

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

%%  Change particle sizes Here

clear; 

L = 0.02;                 % reciever dist
freq = linspace(1e6, 1e9, 1000); 
k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c
m = 1.8;


R = 5e-6; % PARTICLE SIZE (radius of particle in m)


x = k0*R;

%N =((0.0001*(0.01*0.01*0.02))/(pi*R^2)); % Num of particles
                                         % R = 1e-6 -> N=63
                                         % R = 1e-5 -> N=.67
N =((0.0001*(0.01*0.01*0.02))/(pi*R^2)); % so using this hardcoded R 

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

%% USING LAB DATA 

clear; 

L = 0.02;                 % reciever dist

[freq , Einc]= readfromcsv('nf.csv');

Einc_row = Einc(20,:); % grabbing RANDOM ROW, why so many rows???

k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c

m = 1.8;
R = 7.98e-6; % Curve flattens at 8e-6 !!
x = k0*R;
N =((0.0001*(0.01*0.01*0.02))/(pi*R^2)); 

S = S1(0,m,x);              


Esca_sum = zeros(size(freq));
for n = 1:N

    particleR = rand()*L;

    Einc = Einc_row; % use lab data

    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);  
    Esca_sum = Esca_sum + Esca;
end


figure;

plot(freq/1e6, abs(Esca_sum)); % plotting in MHz
xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['R =  ',num2str(R)]);
hold on;
grid on;

%% Multiple Concentrations (same R)
% Substantial randomness in amplitude due to the rand() placement of the
% particles (shown by making all 3 N values the same)
clear; 

L = 0.02;                 % reciever dist

[freq , Einc]= readfromcsv('0M.csv');

Einc_row = Einc(20,:); % grabbing RANDOM ROW, why so many rows???

k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c

m = 1.8;
R = 5e-6; % Curve flattens at 8e-6 !!
x = k0*R;

N =((0.01*0.01*0.02)/(pi*R^2)); 
N1 = N*(0.001); N2 = N*(0.0001); N3 = N*(0.00001);

S = S1(0,m,x);    

Einc = Einc_row; % use lab data

figure;
hold on;

Esca_sum1 = zeros(size(freq)); Esca_sum2 = zeros(size(freq)); Esca_sum3 = zeros(size(freq));
for n = 1:N1

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);  
    Esca_sum1 = Esca_sum1 + Esca;
end
plot(freq/1e6, abs(Esca_sum1), 'DisplayName', (['N1 =  ',num2str(N1)]));

for n = 1:N2

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);  
    Esca_sum2 = Esca_sum2 + Esca;
end
plot(freq/1e6, abs(Esca_sum2), 'DisplayName', (['N2 =  ',num2str(N2)]));
for n = 1:N3

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);  
    Esca_sum3 = Esca_sum3 + Esca;
end
plot(freq/1e6, abs(Esca_sum3), 'DisplayName', (['N3 =  ',num2str(N3)]));



xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['Scattered Energy || R =  ',num2str(R)]);
legend; 
grid on;

%% Multiple Particle Sizes (same N)
% Substantial randomness in amplitude due to the rand() placement of the
% particles (shown by making all 3 R values the same)
clear; 

L = 0.02;                 % reciever dist
[freq , Einc]= readfromcsv('0M.csv');
Einc_row = Einc(20,:); % grabbing RANDOM ROW, why so many rows???
k0 = 2*pi*freq/3e8;     %k = 2pi/wavelength = 2pi/(c/freq) = 2pifreq/c
m = 1.8;
%N =((0.01*0.01*0.02)/(pi*R^2)); 
N = 100;                            % Hardcoded N for this
Einc = Einc_row; % use lab data
Esca_sum1 = zeros(size(freq)); Esca_sum2 = zeros(size(freq)); Esca_sum3 = zeros(size(freq));

figure;
hold on;

R1 = 5e-6;
x1 = k0*R1;
S_1 = S1(0,m,x1); 

for n = 1:N

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S_1, Einc);  
    Esca_sum1 = Esca_sum1 + Esca;
end
plot(freq/1e6, abs(Esca_sum1), 'DisplayName', (['R1 =  ',num2str(R1)]));

R2 = 7e-6;
x2 = k0*R2;
S_2 = S1(0,m,x2); 
for n = 1:N

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S_2, Einc);  
    Esca_sum2 = Esca_sum2 + Esca;
end
plot(freq/1e6, abs(Esca_sum2), 'DisplayName', (['R2 =  ',num2str(R2)]));

R3 = 10e-6;
x3 = k0*R3;
S_3 = S1(0,m,x3); 
for n = 1:N

    particleR = rand()*L;

    Esca = ForwardScatteringEnergy(k0, particleR, S_3, Einc);  
    Esca_sum3 = Esca_sum3 + Esca;
end
plot(freq/1e6, abs(Esca_sum3), 'DisplayName', (['R3 =  ',num2str(R3)]));



xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['Scattered Energy || N =  ',num2str(N)]);
legend; 
grid on;
