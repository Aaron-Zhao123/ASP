alpha_x_one = y_x(24500:24500+1000);
alpha_x_one = detrend(alpha_x_one);

alpha_x_two = y_x(35000:35000+1000);
alpha_x_two = detrend(alpha_x_two);

clear 'w_n_est'
order = 2;
f1 = figure
[ w_n_est, e_n_x ] = lpm_time_ar(alpha_x_one', 0.05, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(221)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, x, sampled from [22000, 28000]');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(2,2,3)
plot([1:length(e_n_x)],e_n_x.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, x');

clear 'w_n_est'
order = 12;
[ w_n_est, e_n_x ] = lpm_time_ar(alpha_x_two', 10, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(222)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, x, sampled from [34000,40000]');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(2,2,4)
plot([1:length(e_n_x)],e_n_x.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, x');








