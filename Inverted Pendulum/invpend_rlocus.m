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

%% Root locus design
figure(1)
rlocus(-G_pend)
title('Root Locus with Proportional Control')

Gc = (s + 4)/(s + 10);

figure(2)
rlocus(-Gc*G_pend)
axis equal
title('Root Locus with Lead Compensation')

figure(3)
K = 20;
CL_pend = feedback(G_pend,-K*Gc);
impulse(CL_pend)
grid on
title('Impulse Disturbance Response of Pendulum Angle under Lead Compensator');

%% What happens to the cart's position?
CL_cart = feedback(1,-K*G_pend*Gc)*G_cart;

t = 0:0.01:5;

figure(4)
impulse(CL_cart, t);
grid on
title('Response of Cart Position to an Impulse Disturbance');
