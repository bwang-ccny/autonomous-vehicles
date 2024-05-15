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

%% Open-loop impluse response
t = 0:0.01:1;
impulse(sys_tf,t);
grid on
title('Open-Loop Impulse Response')

%% Open-loop step response
t = 0:0.05:10;
u = ones(size(t));
[y,t] = lsim(sys_tf,u,t);
plot(t,y)
grid on
title('Open-Loop Step Response')
axis([0 2 -50 50])
legend('x','theta')

%% Zero-pole data
[zeros poles] = zpkdata(G_cart,'v')

[zeros poles] = zpkdata(G_pend,'v')

