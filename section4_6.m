%section 4_6
WGN = randn (1000,1);
a = [1,0.9,0.2];
b = [1];
x_n = filter(b,a,WGN);

[ w_n_error,w_n_regressor, w_n_sign,e_n_error, e_n_regressor,e_n_sign]=signlms(x_n, 0.01, 2 );
[ w_n_org, e_n_org ] = lpm_time_ar( x_n, 0.01, 2 )

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

% subplot(432)
% plot([1:length(e_n_error)],e_n_error.^2,'LineWidth',2)
% ylabel('Error Magnitude');
% xlabel('time');
% title('Error Magnitude, signed-error')
% set(gca,'fontsize',12);
for i = 1 : length(w_n_error(1,:))
    MSE(i) = 1/2 * immse(-a(2:3)',w_n_error(:,i));
end
subplot(245)
plot(x_axis,MSE,'LineWidth',2);
xlim([1,1000])
ylabel('Magnitude');
xlabel('time');
title('Cost function, signed-error');
set(gca,'fontsize',12);
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

% subplot(435)
% plot([1:length(e_n_regressor)],e_n_regressor.^2,'LineWidth',2)
% ylabel('Error Magnitude');
% xlabel('time');
% title('Error, regressor');
% set(gca,'fontsize',12);
for i = 1 : length(w_n_regressor(1,:))
    MSE(i) = 1/2 * immse(-a(2:3)',w_n_regressor(:,i));
end
subplot(246)
plot(x_axis,MSE,'LineWidth',2);
xlim([1,1000])
ylabel('Magnitude');
xlabel('time');
title('Cost function, regressor');
set(gca,'fontsize',12);
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

% subplot(438)
% plot([1:length(e_n_sign)],e_n_sign.^2,'LineWidth',2)
% ylabel('Error Magnitude');
% xlabel('time');
% title('Error, sign-sign');
% set(gca,'fontsize',12);
for i = 1 : length(w_n_sign(1,:))
    MSE(i) = 1/2 * immse(-a(2:3)',w_n_sign(:,i));
end
subplot(247)
plot(x_axis,MSE,'LineWidth',2);
xlim([1,1000])
ylabel('Magnitude');
xlabel('time');
title('Cost function, sign-sign');
set(gca,'fontsize',12);

% original
x_axis = [1:length(w_n_org(1,:))];
subplot(2,4,4)
plot (x_axis,w_n_org(1,:),x_axis,w_n_org(2,:),'LineWidth',2)
xlim([1,1000])
legend('a1','a2');
ylabel('Magnitude');
xlabel('time');
title('a Value Magnitude, Original')
set(gca,'fontsize',12);
% 
% subplot(4,3,11)
% plot([1:length(e_n_org)],e_n_org.^2,'LineWidth',2)
% ylabel('Error Magnitude');
% xlabel('time');
% title('Error Magnitude, signed-error')
% set(gca,'fontsize',12);
for i = 1 : length(w_n_org(1,:))
    MSE(i) = 1/2 * immse(-a(2:3)',w_n_org(:,i));
end
subplot(2,4,8)
plot(x_axis,MSE,'LineWidth',2);
xlim([1,1000])
ylabel('Magnitude');
xlabel('time');
title('Cost function, Original');
set(gca,'fontsize',12);
% signed reressor

R_p_1 = 10 * log10(std(x_n)^2./std(e_n_error)^2)
R_p_2 = 10 * log10(std(x_n)^2./std(e_n_regressor)^2)
R_p_3 = 10 * log10(std(x_n)^2./std(e_n_sign)^2)
R_p_4 = 10 * log10(std(x_n)^2./std(e_n_org)^2)
fig_typ = '.eps';
hgexport(f1, ['figure1_1_1' fig_typ]); 
