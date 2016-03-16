x= randn(1000,1);
%2.1
figure
subplot(1,2,1);
Corre = xcorr(x,'unbiased');
plot ([-999:999], Corre(1:1999,1));
title ('Corrlation Function of WGN, -1000 to 10000');
set(gca,'fontsize',12)
xlabel ('Correlation Lag');
ylabel ('Correlation Value');
%2.2
subplot(1,2,2);
plot ([-999:999], Corre(1:1999,1),'Linewidth',2);
xlim([-50,50]);
title ('Corrlation Function of WGN, -50 to 50');
xlabel ('Correlation Lag');
ylabel ('Correlation Value');
set(gca,'fontsize',12)
