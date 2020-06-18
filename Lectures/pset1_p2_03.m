% 1.017/1.010 Problem Set 1 Solution 
% Problem 2

close all
clear all

% compute tidal elevation

omega=2*pi/24;       % [hr^-1]

time=0:.1:100;
h=0.2*sin(0.5*omega*time)+3*sin(omega*time)+sin(2*omega*time);

figure
plot(time,h)
title('Tidal Elevation vs Time')
xlabel('Time [hr]')
ylabel('Tidal Elevation [m]')
