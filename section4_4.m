%section 4_4
WGN = randn (1000,1);
a = [1,0.9,0.2];
b = [1];
x_n = filter(b,a,WGN);

[ w_n_est, e_n ] = lpm_time_ar(x_n, 0.005, 2 );

x_axis = [1:length(w_n_est(1,:))];
f_2= figure
subplot(311)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('a Value Magnitude');
xlabel('time');
title ('a coefficients, u = 0.005')
set(gca,'fontsize',12);
subplot(312)
plot([1:length(e_n)],e_n.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error sqaured')
set(gca,'fontsize',12);
for i = 1 : length(w_n_est(1,:))
    MSE(i) = 1/2 * immse(-a(2:3)',w_n_est(:,i));
end
subplot(313)
plot(x_axis,MSE,'LineWidth',2);
title('Cost function J(n)')
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
set(gca,'fontsize',12);
fig_typ = '.eps';
hgexport(f1, ['figure4_4_1' fig_typ]); 

 changing step size
[ w_n_est, e_n ] = lpm_time_ar(x_n, 0.01, 2 );
x_axis = [1:length(w_n_est(1,:))];
f1= figure
subplot(241)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('a Value Magnitude');
xlabel('time');
title ('a coefficients, u = 0.01')
set(gca,'fontsize',12);
subplot(245)
plot([1:length(e_n)],e_n.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error sqaured')
set(gca,'fontsize',12);

[ w_n_est, e_n ] = lpm_time_ar(x_n, 0.05, 2 );
subplot(242)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('a Value Magnitude');
xlabel('time');
title ('a coefficients, u = 0.05')
set(gca,'fontsize',12);
subplot(246)
plot([1:length(e_n)],e_n.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error sqaured')
set(gca,'fontsize',12);

[ w_n_est, e_n ] = lpm_time_ar(x_n, 0.1, 2 );
subplot(243)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('a Value Magnitude');
xlabel('time');
title ('a coefficients, u = 0.1')
set(gca,'fontsize',12);
subplot(247)
plot([1:length(e_n)],e_n.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error sqaured')
set(gca,'fontsize',12);

[ w_n_est, e_n ] = lpm_time_ar(x_n, 0.2, 2 );
subplot(244)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('a Value Magnitude');
xlabel('time');
title ('a coefficients, u = 0.2')
set(gca,'fontsize',12);
subplot(248)
plot([1:length(e_n)],e_n.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error sqaured')
set(gca,'fontsize',12);

fig_typ = '.eps';
hgexport(f_2, ['figure4_5_7' fig_typ]); 
