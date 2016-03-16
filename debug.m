A = [AR1];
sys = idpoly(A);
data = iddata(sunspot_nom(:,1),[]);
yp = predict (sys, data , 1);
y_p_AR1_m_1 = yp.OutputData;
yp = predict (sys, data , 2);
y_p_AR1_m_2 = yp.OutputData;
yp = predict (sys, data , 5);
y_p_AR1_m_5 = yp.OutputData;
yp = predict (sys, data , 10);
y_p_AR1_m_10 = yp.OutputData;

A = [AR2];
sys = idpoly(A);
data = iddata(sunspot_nom(:,1),[]);
yp = predict (sys, data , 1);
y_p_AR2_m_1 = yp.OutputData;
yp = predict (sys, data , 2);
y_p_AR2_m_2 = yp.OutputData;
yp = predict (sys, data , 5);
y_p_AR2_m_5 = yp.OutputData;
yp = predict (sys, data , 10);
y_p_AR2_m_10 = yp.OutputData;

A = [AR10];
sys = idpoly(A);
data = iddata(sunspot_nom(:,1),[]);
yp = predict (sys, data , 1);
y_p_AR10_m_1 = yp.OutputData;
yp = predict (sys, data , 2);
y_p_AR10_m_2 = yp.OutputData;
yp = predict (sys, data , 5);
y_p_AR10_m_5 = yp.OutputData;
yp = predict (sys, data , 10);
y_p_AR10_m_10 = yp.OutputData;





figure 
subplot(2,3,1)
plot ([1:length(sunspot_nom)], sunspot_nom,'black'); hold on
plot ([1:length(y_p_AR1_m_1)],y_p_AR1_m_1,'r--'); hold on
plot ([1:length(y_p_AR2_m_1)],y_p_AR2_m_1,'b -.'); hold on
legend('Data','AR1,m=1','AR2,m=1');
title('AR1 and AR2 for m = 1');
xlim([100,150])
%plot ([11:10+length(y_p_AR10_m_1)],y_p_AR10_m_1,'g'); hold on

subplot(2,3,2)
plot ([1:length(sunspot_nom)], sunspot_nom,'black'); hold on
plot ([1:length(y_p_AR1_m_2)],y_p_AR1_m_2,'r --'); hold on
plot ([1:length(y_p_AR2_m_2)],y_p_AR2_m_2,'b -.'); hold on
legend('Data','AR1,m=2','AR2,m=2');
title('AR1 and AR2 for m = 2');
xlim([100,150])

subplot(2,3,3)
plot ([1:length(sunspot_nom)], sunspot_nom,'black'); hold on
plot ([1:length(y_p_AR1_m_2)],y_p_AR1_m_5,'r --'); hold on
plot ([1:length(y_p_AR2_m_5)],y_p_AR2_m_5,'b -.'); hold on
legend('Data','AR1,m=5','AR2,m=5');
title('AR1 and AR2 for m = 5');
xlim([100,150])


subplot(2,3,4)
plot ([1:length(sunspot_nom)], sunspot_nom,'black'); hold on
plot ([1:length(y_p_AR1_m_10)],y_p_AR1_m_10,'r --'); hold on
plot ([1:length(y_p_AR2_m_10)],y_p_AR2_m_10,'b -.'); hold on
legend('Data','AR1,m=10','AR2,m=10');
title('AR1 and AR2 for m = 10');
xlim([100,150])

subplot(2,3,5)
plot ([1:length(sunspot_nom)], sunspot_nom,'black o'); hold on
plot ([1:length(y_p_AR10_m_1)],y_p_AR10_m_1,'r'); hold on
legend('Data','AR10,m=1');
title('AR10 for m = 1');
xlim([100,150])

subplot(2,3,6)
plot ([1:length(sunspot_nom)], sunspot_nom,'black o'); hold on
plot ([1:length(y_p_AR10_m_10)],y_p_AR10_m_10,'r'); hold on
legend('Data','AR10,m=10');
title('AR10 for m = 10');
xlim([100,150])
