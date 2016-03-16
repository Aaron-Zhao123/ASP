%1.21
M = 100; % samples
N = 10000; %time points

v1 = rp1 (M,N);
v2 = rp2 (M,N);
v3 = rp3 (M,N);

v1_mean = mean(v1,1);
v1_std = std(v1,0,1);
v2_mean = mean(v2,1);
v2_std = std(v2,0,1);

v3_mean = mean(v3,1);
v3_std = std(v3,0,1);

figure (1)
subplot(2,3,1)
    plot ([1:N],v1_mean);
    xlabel('time');
    title ('a) Ensemble Mean of v1, 100 samples');

subplot(2,3,4)
    plot ([1:N],v1_std);
    xlabel('time');
    title ('b) Ensemble Std of v1, 100 samples');

subplot(2,3,2)
    plot ([1:N],v2_mean);
    xlabel('time');    
    title ('a) Ensemble Mean of v2, 100 samples');
subplot(2,3,5)
    plot ([1:N],v2_std);
    xlabel('time');
    title ('b) Ensemble Std of v2, 100 samples');
subplot(2,3,3)
    plot ([1:N],v3_mean);
    xlabel('time');
    title ('a) Ensemble Mean of v3, 100 samples');
subplot(2,3,6)
    plot ([1:N],v3_std);
    xlabel('time');
    title ('b) Ensemble Std of v3, 100 samples');
    
% 1.22
M = 4;
N = 1000;
v4 = rp1 (M,N);
v5 = rp2 (M,N);
v6 = rp3 (M,N);

v4_mean = mean(v4,2);
v4_std = std(v4,0,2);
v5_mean = mean(v5,2);
v5_std = std(v5,0,2);
v6_mean = mean(v6,2);
v6_std = std(v6,0,2);
figure (2)
subplot(2,3,1)
    scatter ([1:M],v4_mean);
    xlabel('realization');
    title ('a) Time Mean of v1, 4 realizations');
    ax = gca;
    set(ax,'ylim',[8,12]');
subplot(2,3,4)
    scatter ([1:M],v4_std);
    xlabel('realization');
    title ('b) Time Std of v1, 4 realizations');
    ax = gca;
    set(ax,'ylim',[5,6]');
subplot(2,3,2)
    scatter ([1:M],v5_mean);
    xlabel('realization');
    title ('a) Time Mean of v2, 4 realizations');
    ax = gca;
    set(ax,'ylim',[0,2]');
subplot(2,3,5)
    scatter ([1:M],v5_std);
    xlabel('realization');
    title ('b) Time Std of v2, 4 realizations');
    ax = gca;
    set(ax,'ylim',[0,1]');
subplot(2,3,3)
    scatter ([1:M],v6_mean);
    xlabel('realization');
    title ('a) Time Mean of v3, 4 realizations');
    ax = gca;
    set(ax,'ylim',[0,2]');
subplot(2,3,6)
    scatter ([1:M],v6_std);
    xlabel('realization');
    title ('b) Time Std of v3, 4 realizations');
    ax = gca;
    set(ax,'ylim',[0,2]');
