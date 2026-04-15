%% EM Scatter Simulation 
% Written By : Seth McDaniel

clear; clc; close all;

%% Setup


L = 0.02;                               % reciever dist (m)
[freq , Einc]= readfromcsv('0M.csv');
k0 = 2*pi*freq/3e8;                     % wave number
m = 1.8;                                % refractive index


%% Multiple Concentrations (Same particle sizes)

R = 5e-6;                               % particle radius (m)
x = k0*R;
S = S1(0,m,x); 

N =((0.01*0.01*0.02)/(pi*R^2)); 
N1 = round(N*(0.001)); 
N2 = round(N*(0.0001));                 % Change these multipliers for concentration
N3 = round(N*(0.00001));

Esca_sum1 = sumScatter(N1,L,k0,S,Einc,freq);
Esca_sum2 = sumScatter(N2,L,k0,S,Einc,freq);
Esca_sum3 = sumScatter(N3,L,k0,S,Einc,freq);

figure;
hold on;

plot(freq/1e6, abs(Esca_sum1), 'DisplayName', (['N1 =  ',num2str(N1)]));
plot(freq/1e6, abs(Esca_sum2), 'DisplayName', (['N2 =  ',num2str(N2)]));
plot(freq/1e6, abs(Esca_sum3), 'DisplayName', (['N3 =  ',num2str(N3)]));

xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['Scattered Energy || R =  ',num2str(R)]);
legend; 
grid on;


%% Multiple Particle Sizes (Same Particle Concentrations)

N = 1000; 

R1 = 4e-6;
R2 = 7e-6;                  % change these for sizes (radius in m)
R3 = 10e-6;

x1 = k0 * R1; 
x2 = k0 * R2; 
x3 = k0 * R3;

S_1 = S1(0,m,x1); 
S_2 = S1(0,m,x2);
S_3 = S1(0,m,x3); 

Esca_sum1 = sumScatter(N,L,k0,S_1,Einc,freq);
Esca_sum2 = sumScatter(N,L,k0,S_2,Einc,freq);
Esca_sum3 = sumScatter(N,L,k0,S_3,Einc,freq);

figure;
hold on;

plot(freq/1e6, abs(Esca_sum1), 'DisplayName', (['R1 =  ',num2str(R1)]));
plot(freq/1e6, abs(Esca_sum2), 'DisplayName', (['R2 =  ',num2str(R2)]));
plot(freq/1e6, abs(Esca_sum3), 'DisplayName', (['R3 =  ',num2str(R3)]));


xlabel('frequency (in Mhz)');
ylabel('Energy');
title(['Scattered Energy || N =  ',num2str(N)]);
legend; 
grid on;


%% Summing Function

function Esca_sum = sumScatter(N,L,k0,S,Einc,freq)
Esca_sum = zeros(size(freq));

for n = 1:N
    particleR = rand()*L;
    Esca = ForwardScatteringEnergy(k0, particleR, S, Einc);  
    Esca_sum = Esca_sum + Esca;
end

end
