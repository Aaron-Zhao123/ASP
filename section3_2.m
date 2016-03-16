% generate x and y
x_in = randn(1064,1)
x_tmp = filter([1],[1,0.9],x_in);
x_filtered = x_tmp(1+40:1064);
figure
plot ([1+40:1064],x_filtered,'r--',[1:length(x_in)],x_in,'b');
xlim ([0,1100]);
xlabel('Time');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)


%frequency domain
[h,w]=freqz([1],[1 0.9],512);
f1 = figure
N = length(x_filtered);
subplot(141)
plot([0:1/N:(N-1)/N],pgm(x_filtered),'r',w/(2*pi),abs(h).^2,'b','Linewidth',2); hold on
xlabel('Normalized Frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)

legend('pgm','freqz');
subplot(142)
plot([0:1/N:(N-1)/N],pgm(x_filtered),'r',w/(2*pi),abs(h).^2,'b','Linewidth',2); hold on
xlabel('Normalized Frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)

xlim([0.4,0.5])
legend('pgm','freqz');


[R_y,x_ry] = xcorr(x_filtered,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
a1_hat = -R_y(pos_one)/R_y(pos_zero);
sigma_hat = R_y(pos_zero) + a1_hat*R_y(pos_one);
f_base = [0:1/N:(N-1)/N]
Psd_est = sigma_hat ./ abs(1 + a1_hat*exp(-complex(0,1) * 2 * pi *f_base)).^2
subplot(143)
plot([0:1/N:(N-1)/N],pgm(x_filtered),'r',f_base,Psd_est,'g','Linewidth',2); hold on
xlabel('Normalized Frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)
legend('pgm','model based');
set(gca,'fontsize',12)

subplot(144)
plot([0:1/N:(N-1)/N],pgm(x_filtered),'r',f_base,Psd_est,'g','Linewidth',2); hold on
xlabel('Normalized Frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)
legend('pgm','model based');
set(gca,'fontsize',12)

xlim([0.4,0.5])
%%
fig_typ = '.eps';
hgexport(f1, ['figure3_2_2' fig_typ]);
