
clc
clear all
close all

% momento de inercia del rotor:
J=3.13221E-10; % Kg.m^2
% constante de fricción viscosa del motor:
B=5.65E-04; % N.m.s
% fuerza electromotriz constante:
Ka=0.179324655; %V/rad/s
% par motor constante:
Km=Ka; % N.m/A
% resistencia eléctrica:
R=7.7; %Ω
% inductancia eléctrica:
L =0.000015;
%Voltaje Leido en los Terminales del motor
Vm = 8;


%% Función de transferencias
den = [L*J R*J+L*B R*B+Km*Ka];

%Velocidad angular
Gwv = tf(Km,den);

%Corriente
Giv = tf([J B],den);

%Posición
Gwt = tf(Km,conv(den,[1 0]));

% sim('MotorModelo6v.slx')

