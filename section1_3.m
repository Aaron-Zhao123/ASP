N =[100,1000,10000];

v = randn(1,N(1));
[func_one, x_one] = hist (v,10);
figure
subplot (3,2,1)
bar (x_one,func_one/trapz(x_one,func_one)); hold on
pd = fitdist(v','Normal');
y_one = pdf(pd,x_one)
plot (x_one,y_one,'Linewidth',2);hold on
ylim([0,0.5]);
xlim([-4,4]);
title ('Pdf of randn with 100 samples')

p = polyfit(x_one,func_one/trapz(x_one,func_one),7);
plot (x_one,polyval(p,x_one),'Linewidth',2);
ylabel('Probability')
subplot (3,2,2)
x_norm = [-3:.1:3];
norm = normpdf(x_norm,0,1);
plot(x_norm,norm);
ylabel('Probability')
title ('Theoretical pdf')


v = randn(1,N(2));
[func_one, x_one] = hist (v,20);
subplot (3,2,3)
bar (x_one,func_one/trapz(x_one,func_one)); hold on
pd = fitdist(v','Normal');
y_one = pdf(pd,x_one)
plot (x_one,y_one,'Linewidth',2); hold on
p = polyfit(x_one,func_one/trapz(x_one,func_one),7);
plot (x_one,polyval(p,x_one),'Linewidth',2);
ylim([0,0.5]);
xlim([-4,4]);
ylabel('Probability')
title ('Pdf of randn with 1000 samples')

subplot (3,2,4)
x_norm = [-3:.1:3];
norm = normpdf(x_norm,0,1);
plot(x_norm,norm);
ylabel('Probability')
title ('Theoretical pdf')


v = randn(1,N(3));
[func_one, x_one] = hist (v,50);
subplot (3,2,5);
bar (x_one,func_one/trapz(x_one,func_one)); hold on
pd = fitdist(v','Normal');
y_one = pdf(pd,x_one)
plot (x_one,y_one,'Linewidth',2); hold on
p = polyfit(x_one,func_one/trapz(x_one,func_one),7);
plot (x_one,polyval(p,x_one),'Linewidth',2);
ylim([0,0.5]);
xlim([-4,4]);
ylabel('Probability')
title ('Pdf of randn with 10000 samples')

subplot (3,2,6)
x_norm = [-3:.1:3];
norm = normpdf(x_norm,0,1);
plot(x_norm,norm);
ylabel('Probability')
title ('Theoretical pdf')

