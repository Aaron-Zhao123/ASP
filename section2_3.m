x= randn(1000,1);
y=filter(ones(9,1),[1],x); %order 9 MA filter
Corre_y = xcorr(x,y,'unbiased');
stem ([-999:999], Corre_y(1:1999,1));
title ('Cross Correlation of y[n] and x[n]');
xlim([-20,20]);
ylim([-1,2]);
xlabel ('Correlation Lag');
ylabel ('Correlation Value');
set(gca,'fontsize',12)
