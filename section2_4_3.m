load 'sunspot.dat'
figure
subplot (1,2,1);
plot ([0:10] , 0.4*ones(1,11),'r',[0:10], -0.4*ones(1,11),'r','Linestyle','--'); hold on;
stem (0,-1,'b'); hold on
for i = 1: 10
    [y,e] = aryule(sunspot(:,2),i);
    stem ((i),(-y(i+1)),'b'); hold on 
end
hold on
ylim ([-2,2]);
title ('PCF of sunspot');
xlabel ('PCF lag');
ylabel ('PCF value');
set(gca,'fontsize',12)
sunspot_nom = ( sunspot(:,2) - mean(sunspot(:,2)) )./ std(sunspot(:,2));
subplot (1,2,2);
plot ([0:30] , 0.4*ones(1,31),'r',[0:30], -0.4*ones(1,31),'r','Linestyle','--'); hold on;

stem (0,-1,'b'); hold on
for i = 1: 30
    [y,e2_tmp(i)] = aryule(sunspot_nom,i);
    stem ((i),(-y(i+1)),'b'); hold on 
    if (i == 1)
        e2(i) = e2_tmp(i) + 1; 
    end
    if (i > 1) 
        e2(i) = e2(i-1) + e2_tmp(i) + 1;
    end
end
ylim ([-2,2]);
title ('PCF of normalized sunspot');
xlabel ('PCF lag');
ylabel ('PCF value');
set(gca,'fontsize',12)
hold off
N = length (sunspot_nom);
for i = 1: 30
    MDL(i) = log10(abs(e2_tmp(i))) + i*log10(N)/N;
    AIC(i) = log10(abs(e2_tmp(i))) + 2*i/N;
end
figure
subplot (1,2,1);
plot ([1:30], MDL,'Linewidth',2);
title ('MDL')
xlabel('Model Order')
set(gca,'fontsize',12)

subplot (1,2,2);
plot ([1:30], AIC,'Linewidth',2);
title ('AIC')
xlabel('Model Order')
set(gca,'fontsize',12)


% order number predicition
% AR1 model
AR1 = aryule(sunspot_nom,1);
AR2 = aryule(sunspot_nom,2);
AR10 = aryule(sunspot_nom,10);



% suppose we are at n = 11
M = [1 2 5 10];

% AR1
vec_start = sunspot_nom(10);
for i = 1: 100
    y_predict1(i) = vec_start * (-AR1(1,2));
    vec_start = y_predict1(i);
end

mean_e_one  = mean(y_predict1' - sunspot_nom(11:110,1));
%AR2
vec_start = sunspot_nom(9:10,1);
tmp = fliplr(-AR2(1,2:3));
for i = 1: 100
    y_predict2(i) =  tmp * vec_start;
    vec_start = [vec_start(2);y_predict2(i)];
end

mean_e_two  = mean(y_predict2' - sunspot_nom(11:110,1));


%AR3
vec_start = sunspot_nom(1:10,1);
tmp = fliplr(-AR10(1,2:11));
for i = 1: 100
    y_predict3(i) =  tmp * vec_start;
    vec_start = [vec_start(2:10);y_predict3(i)];
end
err1 = y_predict1' - sunspot_nom(11:110,1);
err2 = y_predict2' - sunspot_nom(11:110,1);
err3 = y_predict3' - sunspot_nom(11:110,1);

figure
%plot ([11:20],err1,'r--',[11:20],err2,'b-*',[11:20],err3,'g','Linewidth',2);
title ('Various AR Models');
ylim([-2,2]);
legend ('AR1','AR2','AR10');
xlabel('Sample number');
ylabel('Error value');
set(gca,'fontsize',12)
