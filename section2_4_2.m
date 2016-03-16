load 'sunspot.dat'
data = sunspot(:,2);
N = [5,20,250];

Corre1 = xcorr(data(1:N(1)),'unbiased');
mean1 = mean(data(1:N(1)));
Corre2 = xcorr(data(1:N(2)),'unbiased');
mean2 = mean(data(1:N(2)));
Corre3 = xcorr(data(1:N(3)),'unbiased');
mean3 = mean (data(1:N(3)));
figure
subplot(2,2,1)
plot([-4:1:4],Corre1');
title ('ACF of sunspot, N = 5')
xlabel ('Correlation lag');
ylabel ('Correlation value');
subplot (2,2,2)
plot ([-19:1:19],Corre2');
title ('ACF of sunspot, N = 20')
xlabel ('Correlation lag');
ylabel ('Correlation value');
subplot (2,2,3)
plot ([-249:1:249],Corre3')
title ('ACF of sunspot, N = 250')
xlabel ('Correlation lag');
ylabel ('Correlation value');
sunspot_zero_mean = sunspot(1:N(3),2) - mean(sunspot(:,2));
Corre_zero_mean = xcorr(sunspot_zero_mean,'unbiased');
subplot (2,2,4)
plot ([-249:1:249],Corre_zero_mean)
title ('ACF of normalized sunspot, N = 250')
xlabel ('Correlation lag');
ylabel ('Correlation value');
set(gca,'fontsize',12)
