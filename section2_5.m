h_hat = zeros(floor(length (h_1)/10),1);

for i = 1 : floor(length (h_1)/10)
    for j = 1:10
        h_hat(i) = h_1(1,(i-1)*10+j) + h_hat(i);
    end
    h_hat(i) = h_hat(i)/10;
end
h_hat_two = zeros(floor(length (h_1)/10),1);

for i = 1 : floor(length (h_1)/10)
    for j = 1:10
        h_hat_two(i) = h_1(1,(i-1)*10+j) + h_hat_two(i);
    end
    h_hat_two(i) = h_hat_two(i)/10 * 0.6;
end

[f1,x1] = ksdensity (h_1);
[f2,x2] = ksdensity(h_hat);
[f3,x3] = ksdensity(h_hat_two);

figure
plot (x1,f1,x2,f2,x3,f3);
xlabel('Heart Rate (bpm)');
ylabel('Probability');
set(gca,'fontsize',12)
s1 = 'Pdf of original heart rate';
s2 = 'Pdf of averaged heart rate with alpha = 1';
s3 = 'Pdf fof averaged heart rate with alpha = 0.6';
legend(s1,s2,s3)

[h1_Corre,x1_corre] = xcorr (detrend(h_1),'coeff');
[h2_Corre,x2_corre] = xcorr (detrend(h_2),'coeff');
[h3_Corre,x3_corre] = xcorr (detrend(h_3),'coeff');
figure
subplot (3,1,1);
plot (x1_corre,h1_Corre,'b');
xlim([-200,200])
xlabel ('Correlation lag');
ylabel ('Correlation Value');
set(gca,'fontsize',12)

title ('ACF of trial 1');
subplot (3,1,2)
plot(x2_corre,h2_Corre,'r');
xlim([-200,200]);
xlabel ('Correlation lag');
ylabel ('Correlation Value');
set(gca,'fontsize',12)

title ('ACF of trial 2');
subplot (3,1,3)
plot(x3_corre,h3_Corre,'g');
xlim([-200,200]);
xlabel ('Correlation lag');
ylabel ('Correlation Value');
title ('ACF of trial 3');
set(gca,'fontsize',12)

% AR ??
for i = 1:30
    [y,e1_tmp(i)] = aryule(detrend(h_1),i);
    [y,e2_tmp(i)] = aryule(detrend(h_2),i);
    [y,e3_tmp(i)] = aryule(detrend(h_3),i);
    if (i == 1)
        e1(i) = e1_tmp(i) + 1; 
        e2(i) = e2_tmp(i) + 1; 
        e3(i) = e3_tmp(i) + 1; 

    end
    if (i > 1) 
        e1(i) = e1(i-1) + e1_tmp(i) + 1;
        e2(i) = e2(i-1) + e2_tmp(i) + 1;
        e3(i) = e3(i-1) + e3_tmp(i) + 1;
    end
end
N1 = length(h_1);
N2 = length(h_2);
N3 = length(h_3);
for i = 1: 30
    MDL1(i) = log10(abs(e1_tmp(i))) + i*log10(N1)/N1;
    AIC1(i) = log10(abs(e1_tmp(i))) + 2*i/N1;
    MDL2(i) = log10(abs(e2_tmp(i))) + i*log10(N2)/N2;
    AIC2(i) = log10(abs(e2_tmp(i))) + 2*i/N2;
    MDL3(i) = log10(abs(e3_tmp(i))) + i*log10(N3)/N3;
    AIC3(i) = log10(abs(e3_tmp(i))) + 2*i/N3;
end
figure
subplot (1,2,1)
plot ([1:30], MDL1,'b',[1:30], MDL2,'r',[1:30], MDL3,'g','Linewidth',2);
xlabel('Model Order')
title ('MDL')
set(gca,'fontsize',12)

legend('trial 1', 'trial 2', 'trial 3')
xlim([0,15])
subplot (1,2,2)
plot ([1:30], AIC1,'b',[1:30], AIC2,'r',[1:30], AIC3,'g','Linewidth',2);
title ('AIC')
set(gca,'fontsize',12)

xlabel('Model Order')
legend('trial 1', 'trial 2', 'trial 3')
xlim([0,15])

