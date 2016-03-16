N =[100,1000,10000];
M = 10000;
v3 = rp3(1,N(1));
[func_one, x_one] = hist (v3,10);
figure
subplot (3,2,1)
bar (x_one,func_one/trapz(x_one,func_one)); hold on
p = polyfit(x_one,func_one/trapz(x_one,func_one),9);
plot (x_one,polyval(p,x_one),'linewidth',2);
xlim([-2,3]);
title ('Pdf of v3 with 100 samples');


subplot (3,2,2)
x_uni_1 = [-2:0.1:3]
pd1 = makedist('Uniform','lower',-1,'upper',2)
pdf1 = pdf(pd1,x_uni_1);
stairs(x_uni_1,pdf1);
title ('Theoretical pdf');


v3 = rp1(1,N(2));
[func_one, x_one] = hist (v3,20);
subplot (3,2,3)
bar (x_one,func_one/trapz(x_one,func_one)); hold on
p = polyfit(x_one,func_one/trapz(x_one,func_one),9);
plot (x_one,polyval(p,x_one),'linewidth',2);
xlim([-5,25])
title ('Pdf of v3 with 1000 samples');

subplot (3,2,4)
x_uni_2 = [-5:0.1:25]
pd2 = makedist('Uniform','lower',0,'upper',20)
pdf2 = pdf(pd2,x_uni_2);
stairs(x_uni_2,pdf2);
ylim([0,0.08]);
title ('Theoretical pdf');

v3 = rp3(1,N(3));
[func_one, x_one] = hist (v3,50);
subplot (3,2,5);
bar (x_one,func_one/trapz(x_one,func_one)); hold on
p = polyfit(x_one,func_one/trapz(x_one,func_one),9);
plot (x_one,polyval(p,x_one),'linewidth',2);
xlim([-2,3]);
title ('Pdf of v3 with 10000 samples');

subplot (3,2,6)
x_uni_3 = [-2:0.1:3];
pd3 = makedist('Uniform','lower',-1,'upper',2)
pdf3 = pdf(pd3,x_uni_3);
stairs(x_uni_3,pdf3);
xlim([-2,3]);
title ('Theoretical pdf');
