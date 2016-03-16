x= randn(1000,1);
y=filter(ones(9,1),[1],x); %order 9 MA filter
Corre_y = xcorr(y,'unbiased');
stem ([-999:999], Corre_y(1:1999,1));
title ('ACF of y[n]');
xlabel ('Correlation Lag');
ylabel ('Correlation Value');
set(gca,'fontsize',12)
xlim([-20,20]);
