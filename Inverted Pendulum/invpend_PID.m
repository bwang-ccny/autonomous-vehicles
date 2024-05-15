clear; close all; clc

%% System parameter
M = 0.5;
m = 0.2;
I = 0.006;
g = 9.8;
l = 0.3;
Q = (M + m)*(I + m*l^2) - (m*l)^2;

%% Transfer functions
s = tf('s');

G_cart = ((I + m*l^2)*s^2 - m*l*g)/(Q*s^4 - (M + m)*m*l*g*s^2);

G_pend = m*l/(-Q*s^2 + (M + m)*m*l*g);

sys_tf = [G_cart ; G_pend];

inputs = {'u'};
outputs = {'x'; 'theta'};

set(sys_tf,'InputName',inputs)
set(sys_tf,'OutputName',outputs)

sys_tf

%% PID Controller
Kp = 20;
Ki = 0;
Kd = 2;
Gc = -pid(Kp,Ki,Kd);

CL_pend = feedback(G_pend,Gc);

t = 0:0.01:5;

figure(1)
impulse(CL_pend,t)
grid on
title({'Response of Pendulum Angle to an Impulse Disturbance';'under PID Control'});

%% What happens to the cart's position?
CL_cart = feedback(1,G_pend*Gc)*G_cart;

t = 0:0.01:5;

figure(2)
impulse(CL_cart, t);
grid on
title('Response of Cart Position to an Impulse Disturbance');



