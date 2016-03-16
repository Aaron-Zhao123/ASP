%section 4_6
WGN = randn (1000,1);
a = [1,0.9,0.2];
b = [1];
x_n = filter(b,a,WGN);

[ w_n_error,w_n_regressor, w_n_sign,e_n_error, e_n_regressor,e_n_sign]=signlms(alpha_a', 0.5, 3 );
[ w_n_org, e_n_org ] = lpm_time_ar( alpha_a', 0.5, 3 )

% signed - error
x_axis = [1:length(w_n_error(1,:))];
f1 = figure
subplot(241)
plot (x_axis,w_n_error(1,:),x_axis,w_n_error(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('Magnitude');
xlabel('time');
title('a Value Magnitude, signd-error')
set(gca,'fontsize',12);

subplot(245)
plot([1:length(e_n_error)],e_n_error.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error Magnitude, signd-error')
set(gca,'fontsize',12);
xlim([1,1000])


% signed reressor

x_axis = [1:length(w_n_regressor(1,:))];
subplot(242)
plot (x_axis,w_n_regressor(1,:),x_axis,w_n_regressor(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('Magnitude');
xlabel('time');
title('a Value Magnitude, regressor')
set(gca,'fontsize',12);

subplot(246)
plot([1:length(e_n_regressor)],e_n_regressor.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error Magnitude, regressor')
set(gca,'fontsize',12);
xlim([1,1000])


% sign sign

x_axis = [1:length(w_n_sign(1,:))];
subplot(243)
plot (x_axis,w_n_sign(1,:),x_axis,w_n_sign(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('Magnitude');
xlabel('time');
title('a Value Magnitude, sign-sign')
set(gca,'fontsize',12);

subplot(247)
plot([1:length(e_n_sign)],e_n_sign.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error Magnitude, sign-sign')
set(gca,'fontsize',12);
xlim([1,1000])


x_axis = [1:length(w_n_org(1,:))];
subplot(244)
plot (x_axis,w_n_org(1,:),x_axis,w_n_org(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('Magnitude');
xlabel('time');
title('a Value Magnitude, original')
set(gca,'fontsize',12);

subplot(248)
plot([1:length(e_n_org)],e_n_org.^2,'LineWidth',2)
ylabel('Error Magnitude');
xlabel('time');
title('Error Magnitude, original')
set(gca,'fontsize',12);
xlim([1,1000])

R_p_1 = 10 * log10(std(alpha_a)^2./std(e_n_error)^2)
R_p_2 = 10 * log10(std(alpha_a)^2./std(e_n_regressor)^2)
R_p_3 = 10 * log10(std(alpha_a)^2./std(e_n_sign)^2)
R_p_4 = 10 * log10(std(alpha_a)^2./std(e_n_org)^2)

fig_typ = '.eps';
hgexport(f1, ['figure4_6_2' fig_typ]); 
