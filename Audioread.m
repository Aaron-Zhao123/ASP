[y_e,f_e] = audioread('e.m4a')
[y_a,f_a] = audioread('a.m4a')
[y_s,f_s] = audioread('s.m4a')
[y_t,f_t] = audioread('t.m4a')
[y_x,f_x] = audioread('x.m4a')

%Consider 
alpha_a = y_a(length(y_a)/2:length(y_a)/2+1000);
alpha_a = detrend(alpha_a);
alpha_e = y_e(length(y_e)/2:length(y_e)/2+1000);
alpha_e = detrend(alpha_e);
alpha_s = y_s(20000:20000+1000);
alpha_s = detrend(alpha_s);
alpha_t = y_t(45000:45000+1000);
alpha_t = detrend(alpha_t);
alpha_x = y_x(24500:24500+1000);
alpha_x = detrend(alpha_x);


for i = 1: 50
    [y,e_alpha_a(i)] = aryule(alpha_a,i);
    [y,e_alpha_e(i)] = aryule(alpha_e,i);
    [y,e_alpha_s(i)] = aryule(alpha_s,i);
    [y,e_alpha_t(i)] = aryule(alpha_t,i);
    [y,e_alpha_x(i)] = aryule(alpha_x,i);
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
