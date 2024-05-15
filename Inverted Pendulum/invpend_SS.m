clear; close all; clc

%% System parameter
M = 0.5;
m = 0.2;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M + m)*(I + m*l^2) - (m*l)^2;

%% State-space equations

A = [0      1              0           0;
     0      0           -m^2*l^2*g/q   0;
     0      0              0           1;
     0      0         (M + m)*m*l*g/q  0];
B = [     0;
     (I+m*l^2)/q;
          0;
        -m*l/q];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];

states = {'x' 'x_dot' 'theta' 'theta_dot'};
inputs = {'u'};
outputs = {'x'; 'theta'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs)

sys_tf = tf(sys_ss)

poles = eig(A)

%% Controllability
co = ctrb(sys_ss);
controllability = rank(co)

%% LQR controller
Q = C'*C;
R = 1;
K = lqr(A,B,Q,R)

Ac = [(A - B*K)];
Bc = [B];
Cc = [C];
Dc = [D];

states = {'x' 'x_dot' 'theta' 'theta_dot'};
inputs = {'r'};
outputs = {'x'; 'theta'};

sys_cl = ss(Ac,Bc,Cc,Dc,'statename',states,'inputname',inputs,'outputname',outputs);

t = 0:0.01:10;
r = 1*ones(size(t));
[y,t,x] = lsim(sys_cl,r,t);
plot(t,y(:,1),t,y(:,2))
grid on

title('Step Response with LQR Control')
legend('x','theta')


