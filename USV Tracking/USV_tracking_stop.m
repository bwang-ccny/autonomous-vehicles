close all;
%% simout = [t, x, y, th, vx, vy, w, tau1, tau2];

t = simout(:,1);
x = simout(:,2);
y = simout(:,3);
th = simout(:,4);
vx = simout(:,5);
vy = simout(:,6);
w = simout(:,7);
tau01 = simout(:,8);
tau02 = simout(:,9);

%% simout = [t, x, y, th, vx, vy, w, tau1, tau2];

t1 = simout1(:,1);
x1 = simout1(:,2);
y1 = simout1(:,3);
th1 = simout1(:,4);
vx1 = simout1(:,5);
vy1 = simout1(:,6);
w1 = simout1(:,7);
tau11 = simout1(:,8);
tau12 = simout1(:,9);

%% Figure 1: Path
figure(1)
hold on
grid on
box on
plot(x,y, 'linestyle','-','linewidth',1.5)
plot(x1,y1, 'linestyle','-','linewidth',1.5)
xlabel('$x~$[m]','interpreter','latex','fontsize',18)
ylabel('$y~$[m]','interpreter','latex','fontsize',18)
% axis([-7,7,-7,7])
axis equal
legend('Desired','Actual')

%% Figure 2: Configuration trajectories
figure(2)
subplot(3,1,1)
hold on
grid on
box on
plot(t,x, 'linestyle','-','linewidth',1.5)
plot(t,x1, 'linestyle','-','linewidth',1.5)
ylabel('$x~$[m]','interpreter','latex','fontsize',18)
legend('Desired','Actual')

subplot(3,1,2)
hold on
grid on
box on
plot(t,y, 'linestyle','-','linewidth',1.5)
plot(t,y1, 'linestyle','-','linewidth',1.5)
ylabel('$y~$[m]','interpreter','latex','fontsize',18)

subplot(3,1,3)
hold on
grid on
box on
plot(t,th, 'linestyle','-','linewidth',1.5)
plot(t,th1, 'linestyle','-','linewidth',1.5)
ylabel('$\theta~$[rad]','interpreter','latex','fontsize',18)
xlabel('Time [sec]','interpreter','latex','fontsize',18)



% 
% %% Figure 3: Velocity trajectories
% figure(3)
% subplot(3,1,1)
% hold on
% grid on
% box on
% plot(t,vx, 'linestyle','-','linewidth',1.5)
% ylabel('$v_x~$[m/s]','interpreter','latex','fontsize',18)
% 
% subplot(3,1,2)
% hold on
% grid on
% box on
% plot(t,vy, 'linestyle','-','linewidth',1.5)
% ylabel('$v_y~$[m/s]','interpreter','latex','fontsize',18)
% 
% subplot(3,1,3)
% hold on
% grid on
% box on
% plot(t,w, 'linestyle','-','linewidth',1.5)
% ylabel('$\omega~$[rad/s]','interpreter','latex','fontsize',18)
% xlabel('Time [sec]','interpreter','latex','fontsize',18)
% 
% %% Figure 4: Control inputs
% figure(4)
% hold on
% grid on
% box on
% plot(t,tau1, 'linestyle','-','linewidth',1.5)
% plot(t,tau2, 'linestyle','-','linewidth',1.5)
% xlabel('Time [sec]','interpreter','latex','fontsize',18)
% ylabel('Control Inputs','interpreter','latex','fontsize',18)
% legend('\tau_1','\tau_2','fontsize',14)
