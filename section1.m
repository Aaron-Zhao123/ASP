%1.1
x = rand(1000,1); %generate 1000 sample vector
figure(1)
plot(x); % X is statistically stationary
xlabel('Sample')
mean_x = mean(x); 
% since N is not infinite, this mean is not absolutely accurate

%1.11
f2 = figure(2)
for i = 1:10000
    x_estimator(i) = mean(rand(1000,1));
end
subplot(2,1,1)
histogram(x_estimator);
histfit(x_estimator);
ylabel('Number of samples')
title('Sample Mean');
set(gca,'fontsize',12);
%central limit theorem

%1.12
subplot(2,1,2)
std_x = std(x);
for i = 1:10000
    std_estimator(i) = std(rand(1000,1));
end
histogram(std_estimator);
histfit(std_estimator);
ylabel('Number of samples')
title('Sample Std');
set(gca,'fontsize',12);
%central limit theorem

%1.13
%bias equation: B= E(x)-m_est
f4 = figure(3)
subplot (4,1,1)
scatter([1:10],x_estimator(1:10));
hold on
plot ([1:10],0.5*ones(10,1));
hold off
xlabel('Realization');
title('Mean')
set(gca,'fontsize',12);
%histogram(x_estimator(1:1000));
subplot (4,1,2)
scatter([1:10],std_estimator(1:10));
hold on
plot ([1:10],sqrt(1/12)*ones(10,1));
hold off
xlabel('Realization');
title('Std')
set(gca,'fontsize',12);
%histogram(std_estimator(1:1000));
subplot (4,1,3)
scatter([1:10],x_estimator(1:10)-0.5);
hold on
plot ([1:10],zeros(10,1));
hold off
xlabel('Realization');
title('Bias of Mean')
set(gca,'fontsize',12);
%histogram((x_estimator(1:1000)-0.5));
subplot (4,1,4)
scatter([1:10],x_estimator(1:10)-0.5);
hold on
plot ([1:10],zeros(10,1));
hold off
xlabel('Realization');
title('Bias of Std');
set(gca,'fontsize',12);
%histogram((std_estimator(1:1000)-1/sqrt(12)));



%1.5
x_normal = randn(1000,1); %generate 1000 sample vector
figure(5)
plot(x_normal); % X is statistically stationary
xlabel('sample')
mean_x_normal = mean(x_normal); 
% since N is not infinite, this mean is not absolutely accurate

%1.11
f3 = figure(6)
for i = 1:10000
    x_normal_estimator(i) = mean(randn(1000,1));
end
subplot(2,1,1)
histogram(x_normal_estimator);
histfit(x_normal_estimator);
ylabel('Number of samples')
title('Sample Mean');
set(gca,'fontsize',12);

%central limit theorem

%1.12
subplot(2,1,2)
std_x = std(x_normal);
for i = 1:10000
    std_normal_estimator(i) = std(randn(1000,1));
end
histogram(std_normal_estimator);
histfit(std_normal_estimator);
ylabel('Number of samples')
title('Sample Std');
set(gca,'fontsize',12);

%central limit theorem

%1.13
%bias equation: B= E(x)-m_est
f5 = figure(7)
subplot (4,1,1)
scatter([1:10],x_normal_estimator(1:10));
hold on
plot ([1:10],zeros(10,1));
hold off
xlabel('Realization');
title('Mean');
set(gca,'fontsize',12);
%histogram(x_estimator(1:1000));
subplot (4,1,2)
scatter([1:10],std_normal_estimator(1:10));
hold on
plot ([1:10],ones(10,1));
hold off
xlabel('Realization');
title('Std');
set(gca,'fontsize',12);
%histogram(std_estimator(1:1000));
subplot (4,1,3)
scatter([1:10],x_normal_estimator(1:10));
hold on
plot ([1:10],zeros(10,1));
hold off
xlabel('Realization');
title('Bias of Mean');
set(gca,'fontsize',12);
%histogram((x_estimator(1:1000)-0.5));
subplot (4,1,4)
scatter([1:10],std_normal_estimator(1:10)-1);
hold on
plot ([1:10],zeros(10,1));
hold off
xlabel('Realization');
title('Bias of Std');
set(gca,'fontsize',12);
%histogram((std_estimator(1:1000)-1/sqrt(12)));


%1.14
f6 = figure(4)
hist (x)
counts = hist(x);
x_uni = [-1:0.1:1.3];
pd2 = makedist('Uniform','lower',0,'upper',1)
pdf2 = pdf(pd2,x_uni);
bar ([0.1:0.1:1],counts/100); hold on
stairs(x_uni,pdf2,'r'); hold off
xlim ([-0.1,1.3]);
ylabel('Probability');
set(gca,'fontsize',12);

% estimate converges as N turns infinity
% the number of histograms serve as sampling frequency
%1.14
f7 = figure(8)
x_normal = randn(10000,1);
[f,x_axis] = hist(x_normal,80);

g=1/sqrt(2*pi)*exp(-0.5*x_axis.^2); %pdf of normal euqation

bar(x_axis,f/1000);hold on
plot(x_axis, g, 'r');hold off
ylabel('Probability');
set(gca,'fontsize',12);
% estimate converges as N turns infinity
% the number of histograms serve as sampling frequency








