load 'sunspot.dat'
sunspot = sunspot(:,2);
sunspot_norm = detrend (sunspot,'constant');

f1 = figure
N = length(sunspot);
[R_y,x_ry] = xcorr(sunspot,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
a1_hat = -R_y(pos_one)/R_y(pos_zero);
sigma_hat = R_y(pos_zero) + a1_hat*R_y(pos_one);
f_base = [0:1/N:(N-1)/N];
[h,w]=freqz([1],[1 a1_hat],288);
Psd_est = sigma_hat .* abs(h).^2;
subplot(231)
plot([0:1/N:(N-1)/N],pgm(sunspot),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Original sunspot, (AR1)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
xlim([0,0.5]);
set(gca,'fontsize',12)

N = length(sunspot_norm);
[R_y,x_ry] = xcorr(sunspot_norm,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
a1_hat = -R_y(pos_one)/R_y(pos_zero);
sigma_hat = R_y(pos_zero) + a1_hat*R_y(pos_one);
[h,w]=freqz([1],[1 a1_hat],288);
Psd_est = sigma_hat .* abs(h).^2;
subplot(234)
plot([0:1/N:(N-1)/N],pgm(sunspot_norm),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Normalized sunspot (AR1)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)

xlim([0,0.5]);

%AR 2
N = length(sunspot);
[R_y,x_ry] = xcorr(sunspot,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
for i = 1:2
    for j = 1:2
        A(i,j) = R_y(pos_zero + abs(i-j));
    end
end
for i = 1:2
    Y(i,1) = R_y(pos_zero+i);
end
X = A^(-1)*Y;
X = cat(1,1,-X);
[h,w]=freqz([1],X,288);
for i = 1: 2
    sigma_hat = X(i)*R_y(pos_zero + i-1)+ sigma_hat;
end
Psd_est = sigma_hat .* abs(h).^2;
subplot(232)
plot([0:1/N:(N-1)/N],pgm(sunspot),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Original sunspot (AR2)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)

xlim([0,0.5]);
           
N = length(sunspot_norm);
[R_y,x_ry] = xcorr(sunspot_norm,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
for i = 1:2
    for j = 1:2
        A(i,j) = R_y(pos_zero + abs(i-j));
    end
end
for i = 1:2
    Y(i,1) = R_y(pos_zero+i);
end
X = A^(-1)*Y;
X = cat(1,1,-X);
[h,w]=freqz([1],X,288);
for i = 1: 2
    sigma_hat = X(i)*R_y(pos_zero + i-1)+ sigma_hat;
end
Psd_est = sigma_hat .* abs(h).^2;
subplot(235)
plot([0:1/N:(N-1)/N],pgm(sunspot_norm),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Normalized sunspot (AR2)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)
xlim([0,0.5]);
            



% AR 50
N = length(sunspot);
[R_y,x_ry] = xcorr(sunspot,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
for i = 1:50
    for j = 1:50
        A(i,j) = R_y(pos_zero + abs(i-j));
    end
end
for i = 1:50
    Y(i,1) = R_y(pos_zero+i);
end
X = A^(-1)*Y;
X = cat(1,1,-X);
[h,w]=freqz([1],X,288);
for i = 1: 50
    sigma_hat = X(i)*R_y(pos_zero + i-1)+ sigma_hat;
end
Psd_est = sigma_hat .* abs(h).^2;
subplot(233)
plot([0:1/N:(N-1)/N],pgm(sunspot),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Original sunspot (AR50)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)
xlim([0,0.5]);
            
N = length(sunspot_norm);
[R_y,x_ry] = xcorr(sunspot_norm,'unbiased');
pos_zero = find(x_ry == 0);
pos_one = pos_zero +1;
for i = 1:50
    for j = 1:50
        A(i,j) = R_y(pos_zero + abs(i-j));
    end
end
for i = 1:50
    Y(i,1) = R_y(pos_zero+i);
end
X = A^(-1)*Y;
X = cat(1,1,-X);
[h,w]=freqz([1],X,288);
for i = 1: 50
    sigma_hat = X(i)*R_y(pos_zero + i-1)+ sigma_hat;
end
Psd_est = sigma_hat .* abs(h).^2;
subplot(236)
plot([0:1/N:(N-1)/N],pgm(sunspot_norm),'r',w./(2*pi),Psd_est,'g','Linewidth',2); hold on
legend('pgm','model based');
title('Normalized sunspot (AR50)');
xlabel('Normalized frequency');
ylabel('PSD(W/HZ)')
set(gca,'fontsize',12)
xlim([0,0.5]);
fig_typ = '.eps';
hgexport(f1, ['figure3_2_3' fig_typ]);     

