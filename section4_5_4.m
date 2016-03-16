% section 4_5_4
Fs = 44.1e3;

[P, Q] = rat(16000/Fs);

y_a_new = resample(y_a, P, Q);
y_e_new = resample(y_e, P, Q);
y_s_new = resample(y_s, P, Q);
y_t_new = resample(y_t, P, Q);
y_x_new = resample(y_x, P, Q);

alpha_a_new = y_a_new(9000:10000);
alpha_a_new = detrend(alpha_a_new);
alpha_e_new = y_e_new(12000:13000);
alpha_e_new = detrend(alpha_e_new);
alpha_s_new = y_s_new(7000:7000+1000);
alpha_s_new = detrend(alpha_s_new);
alpha_t_new = y_t_new(15000:15000+1000);
alpha_t_new = detrend(alpha_t_new);
alpha_x_new = y_x_new(9500:9500+1000);
alpha_x_new = detrend(alpha_x_new);



% a
clear 'w_n_est'
order = 12;

[ w_n_est, e_n_a ] = lpm_time_ar(alpha_a_new', 0.1, order )
x_axis = [1:length(w_n_est(1,:))];
f2= figure
subplot(251)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, a');
set(gca,'fontsize',12);
subplot(256)
plot([1:length(e_n_a)],e_n_a.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

title ('Error, a');
set(gca,'fontsize',12);


%e
clear 'w_n_est'
order = 12;

[ w_n_est, e_n_e ] = lpm_time_ar(alpha_e_new', 0.5, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(252)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])

title ('Coefficients, e');
set(gca,'fontsize',12);
subplot(257)
plot([1:length(e_n_e)],e_n_e.^2)
ylabel('Error Magnitude');
xlabel('time');
set(gca,'fontsize',12);
xlim([0,1000])

title ('Error, e');

%s
clear 'w_n_est'
order = 19;

[ w_n_est, e_n_s ] = lpm_time_ar(alpha_s_new', 0.1, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(253)
hold on;
tmp = [];
for i = 1 : 9
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, s');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(258)
plot([1:length(e_n_s)],e_n_s.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, s');
%t
clear 'w_n_est'
order = 12;

[ w_n_est, e_n_t ] = lpm_time_ar(alpha_t_new', 0.1, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(254)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, t');
set(gca,'fontsize',12);
subplot(259)
plot([1:length(e_n_t)],e_n_t.^2)
ylabel('Error Magnitude');
xlabel('time');
set(gca,'fontsize',12);
xlim([0,1000])
title ('Error, t');



%x
clear 'w_n_est'
order = 12;

[ w_n_est, e_n_x ] = lpm_time_ar(alpha_x_new', 0.05, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(255)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, x');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(2,5,10)
plot([1:length(e_n_x)],e_n_x.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, x');

for i = 1: 50
    [y,e_alpha_a(i)] = aryule(alpha_a_new,i);
    [y,e_alpha_e(i)] = aryule(alpha_e_new,i);
    [y,e_alpha_s(i)] = aryule(alpha_s_new,i);
    [y,e_alpha_t(i)] = aryule(alpha_t_new,i);
    [y,e_alpha_x(i)] = aryule(alpha_x_new,i);
end
N = length (alpha_a);
for i = 1: 20
    MDLa(i) = log10(abs(e_alpha_a(i))) + i*log10(N)./N;
    AICa(i) = log10(abs(e_alpha_a(i))) + 2*i./N;
    MDLe(i) = log10(abs(e_alpha_e(i))) + i*log10(N)./N;
    AICe(i) = log10(abs(e_alpha_e(i))) + 2*i./N;
    MDLs(i) = log10(abs(e_alpha_s(i))) + i*log10(N)./N;
    AICs(i) = log10(abs(e_alpha_s(i))) + 2*i./N;
    MDLt(i) = log10(abs(e_alpha_t(i))) + i*log10(N)./N;
    AICt(i) = log10(abs(e_alpha_t(i))) + 2*i./N;
    MDLx(i) = log10(abs(e_alpha_x(i))) + i*log10(N)./N;
    AICx(i) = log10(abs(e_alpha_x(i))) + 2*i./N;
end

f1 = figure
subplot (151);
plot ([1:20], MDLa,[1:20], AICa,'Linewidth',2);
title ('MDL and AIC of a')
xlabel('Model Order')
set(gca,'fontsize',12)
legend('MDL','AIC')

subplot (152);
plot ([1:20], MDLe,[1:20], AICe,'Linewidth',2);
title ('MDL and AIC of e')
xlabel('Model Order')
legend('MDL','AIC')
set(gca,'fontsize',12)

subplot (153);
plot ([1:20], MDLs,[1:20], AICs,'Linewidth',2);
title ('MDL and AIC of s')
legend('MDL','AIC')
xlabel('Model Order')
set(gca,'fontsize',12)

subplot (154);
plot ([1:20], MDLt,[1:20], AICt,'Linewidth',2);
title ('MDL and AIC of t')
legend('MDL','AIC')
xlabel('Model Order')
set(gca,'fontsize',12)

subplot (155);
plot ([1:20], MDLx,[1:20], AICx,'Linewidth',2);
title ('MDL and AIC of x')
legend('MDL','AIC')
xlabel('Model Order')
set(gca,'fontsize',12)

R_p_a = 10 * log10(std(alpha_a_new)^2./std(e_n_a)^2)
R_p_e = 10 * log10(std(alpha_e_new)^2./std(e_n_e)^2)
R_p_s = 10 * log10(std(alpha_s_new)^2./std(e_n_s)^2)
R_p_t = 10 * log10(std(alpha_t_new)^2./std(e_n_t)^2)
R_p_x = 10 * log10(std(alpha_x_new)^2./std(e_n_x)^2)

