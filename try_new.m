x = rand(1000,1); %generate 1000 sample vector
x_normal = randn(10000,1)
%1.14
figure(4)
hist (x)
counts = hist(x);
bar ([0.1:0.1:1],counts/100); hold on
plot ([0:0.1:1], ones(11,1),'r'); hold off
ylabel('Probability');
% estimate converges as N turns infinity
% the number of histograms serve as sampling frequency
figure(8)
subplot(1,3,1)
[f,x_axis] = hist(x_normal,10);
g=1/sqrt(2*pi)*exp(-0.5*x_axis.^2); %pdf of normal euqation
bar(x_axis,f/trapz(x_axis,f));hold on
plot(x_axis, g, 'r');hold off
ylabel('Probability');
title('Pdf of randn (10000 samples), 10 bins')

subplot(1,3,2)
[f,x_axis] = hist(x_normal,100);
g=1/sqrt(2*pi)*exp(-0.5*x_axis.^2); %pdf of normal euqation
bar(x_axis,f/trapz(x_axis,f));hold on
plot(x_axis, g, 'r');hold off
ylabel('Probability');
title('Pdf of randn (10000 samples), 100 bins')
% estimate converges as N turns infinity
% the number of histograms serve as sampling frequency

subplot(1,3,3)
[f,x_axis] = hist(x_normal,1000);
g=1/sqrt(2*pi)*exp(-0.5*x_axis.^2); %pdf of normal euqation
bar(x_axis,f/trapz(x_axis,f));hold on
plot(x_axis, g, 'r');hold off
ylabel('Probability');
title('Pdf of randn (10000 samples), 1000 bins')







