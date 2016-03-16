clear 'w_n_est'
order = 10;

[ w_n_est, e_n_a ] = lpm_time_ar(alpha_a', 0.05, order )
x_axis = [1:length(w_n_est(1,:))];
f1= figure
subplot(251)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, a');
set(gca,'fontsize',12);
subplot(256)
plot([1:length(e_n_a)],e_n_a.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

title ('Error, a');
set(gca,'fontsize',12);
R_p_a = 10 * log10(std(alpha_a)^2./std(e_n_a)^2)
