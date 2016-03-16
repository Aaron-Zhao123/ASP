% section 3_4

rr_1_norm = detrend (60 ./ (h1(1:51)));
pic1 = figure
[ P_f_one,f_one ] = pgm( rr_1_norm' )
subplot(331)
plot (f_one,P_f_one);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('50 samples, standard pgm, Trial 1')
rr_1_norm = detrend (60 ./ (h1(1:151)));
[ P_f_one,f_one ] = pgm( rr_1_norm' )
subplot(332)
plot (f_one,P_f_one);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('150 samples, standard pgm, Trial 1')

% Trial 2
rr_2_norm = detrend (60 ./ (h2(1:51)));
[ P_f_two,f_two ] = pgm( rr_2_norm' )
subplot(334)
plot (f_two,P_f_two);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('50 samples, standard pgm, Trial 2')
rr_2_norm = detrend (60 ./ (h2(1:151)));
[ P_f_two,f_two ] = pgm( rr_2_norm' )
subplot(335)
plot (f_two,P_f_two);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('150 samples, standard pgm, Trial 2')

% Trial 3
rr_3_norm = detrend (60 ./ (h3(1:51)));
[ P_f_three,f_three ] = pgm( rr_3_norm' )
subplot(337)
plot (f_three,P_f_three);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('50 samples, standard pgm, Trial 3')

rr_3_norm = detrend (60 ./ (h3(1:151)));
[ P_f_three,f_three ] = pgm( rr_3_norm' )
subplot(338)
plot (f_three,P_f_three);
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('150 samples, standard pgm, Trial 3')

% calculate averages
rr1_norm = detrend(60./h1);
rr2_norm = detrend(60./h2);
rr3_norm = detrend(60./h3);
for i = 1:5
    [px1(i,:),f1] = pgm(detrend(rr1_norm(40*(i-1)+1:40*i))');
end
pxa1 = mean(px1);
for i = 1:5
    [px2(i,:),f2] = pgm(detrend(rr2_norm(40*(i-1)+1:40*i))');
end
pxa2 = mean(px2);
for i = 1:5
    [px3(i,:),f3] = pgm(detrend(rr3_norm(40*(i-1)+1:40*i))');
end
pxa3 = mean(px3);
subplot(333)
plot(f1,pxa1)
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('Averaged pgm, Trial 1')
subplot(336)
plot(f2,pxa2)
xlim([0,0.5])
set(gca,'fontsize',12)
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
title('Averaged pgm, Trial 2')
subplot(339)
plot(f3,pxa3)
xlim([0,0.5])
xlabel('Normalized Frequency')
ylabel('PSD (W/HZ)')
set(gca,'fontsize',12)
title('Averaged pgm, Trial 3')

fig_typ = '.eps';
hgexport(pic1, ['figure3_5_1' fig_typ]); 

