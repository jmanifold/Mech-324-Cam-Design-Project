%Project 3 Cam Design
%Written by: Jack Manifold
%Created on: March 5, 2021

%Written for Mech 324, Dynamics of Machines

clear all
close all
format compact

%defining intervals
%rise
beta_r_deg = 180;
beta_r = beta_r_deg * pi/180;

%fall
beta_f_deg = 90;
beta_f = beta_f_deg * pi/180;

%dwell
beta_d_deg = 360 - beta_f_deg - beta_r_deg;
beta_d = beta_d_deg * pi/180;

%Important Imputs

h = 3; % Max height of rise
Rf = 1; % radius of roller follower
Rb = 2; % inial guess of cams base radius
t = 2; % time it takes for the cam to make a full rotation

omega = 2*pi/t; %angular speed that the cam is being driven at (rads/sec)


%equation function
[S, V, A, J, s, v, a, j, theta, C_r, C_f, x_rf, y_rf, Rp, phi, x_fff, y_fff, Rb_fff]= poly_4_5_6_equation_function(beta_r,beta_r_deg,...
    beta_f,beta_f_deg,beta_d, beta_d_deg, h,Rf, Rb, omega);


%% Plotting

%svaj

set(gcf,'position',[200,200,700,700])
% s
subplot(2,2,1)
plot(theta, s)
title('Displacement (s)')
xlim([0,360])
ylim([-1,h+h/4])
xlabel('theta (deg)')
ylabel('Follower height (in)')

% v
subplot(2,2,2)
plot(theta, v)
title('Velocity (v)')
xlim([0,360])
ylim([min(v)+min(v)/4, max(v)+max(v)/4])
xlabel('theta (deg)')
ylabel('Follower velocity (in/sec)')

% a
subplot(2,2,3)
plot(theta, a)
title('Acceleration (a)')
xlim([0,360])
ylim([min(a)+min(a)/4, max(a)+max(a)/4])
xlabel('theta (deg)')
ylabel('Follower acceleration (in/rads^2)')

% j
subplot(2,2,4)
plot(theta, j)
title('Jerk (j)')
xlim([0,360])
ylim([min(j)+min(j)/4, max(j)+max(j)/4])
xlabel('theta (deg)')
ylabel('Follower acceleration (in/rads^3)')



%SVAJ

figure(2)
set(gcf,'position',[200,200,700,700])
% S
subplot(2,2,1)
plot(theta, S)
title('Displacement (S)')
xlim([0,360])
ylim([-1,h+h/4])
xlabel('theta (deg)')
ylabel('Follower height (in)')

% V
subplot(2,2,2)
plot(theta, V)
title('Velocity (V)')
xlim([0,360])
ylim([min(V)+min(V)/4, max(V)+max(V)/4])
xlabel('theta (deg)')
ylabel('Follower velocity (in/sec)')

% A
subplot(2,2,3)
plot(theta, A)
title('Acceleration (A)')
xlim([0,360])
ylim([min(A)+min(A)/4, max(A)+max(A)/4])
xlabel('theta (deg)')
ylabel('Follower acceleration (in/sec^2)')

% J
subplot(2,2,4)
plot(theta, J)
title('Jerk (J)')
xlim([0,360])
ylim([min(J)+min(J)/4, max(J)+max(J)/4])
xlabel('theta (deg)')
ylabel('Follower acceleration (in/sec^3)')


%Roller Follower Cam Gemometry
figure
plot(x_rf,y_rf)
xlim([-8.5,4.5])
ylim([-5.5,7.5])
xlabel('Length (in)')
ylabel('Height (in)')
title('Roller Follower Cam Geometry')
daspect([1 1 1])

%Flat Faced Follower Cam Geometry
figure
plot(x_fff,y_fff)
xlim([min(x_fff)+min(x_fff)/4,max(x_fff)+max(x_fff)/4])
ylim([min(y_fff)+min(y_fff)/4,max(y_fff)+max(y_fff)/4])
xlabel('Length (in)')
ylabel('Height (in)')
title('Flat Faced Follower Cam Geometry')
daspect([1 1 1])

