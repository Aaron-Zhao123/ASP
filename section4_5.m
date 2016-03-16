%section4_5
% AR3 a, AR3 e ... 
% for computing a

% a
clear 'w_n_est'
order = 3;

[ w_n_est, e_n_a ] = lpm_time_ar(alpha_a', 0.5, order )
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


%e
clear 'w_n_est'
order = 7;

[ w_n_est, e_n_e ] = lpm_time_ar(alpha_e', 0.1, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(252)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])

title ('Coefficients, e');
set(gca,'fontsize',12);
subplot(257)
plot([1:length(e_n_e)],e_n_e.^2)
ylabel('Error Magnitude');
xlabel('time');
set(gca,'fontsize',12);
xlim([0,1000])

title ('Error, e');

%s
clear 'w_n_est'
order = 15;

[ w_n_est, e_n_s ] = lpm_time_ar(alpha_s', 0.05, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(253)
hold on;
tmp = [];
for i = 1 : 9
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
title ('Coefficients, s');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(258)
plot([1:length(e_n_s)],e_n_s.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, s');
%t
clear 'w_n_est'
order = 6;

[ w_n_est, e_n_t ] = lpm_time_ar(alpha_t', 0.1, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(254)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
xlim([0,1000])
title ('Coefficients, t');
set(gca,'fontsize',12);
subplot(259)
plot([1:length(e_n_t)],e_n_t.^2)
ylabel('Error Magnitude');
xlabel('time');
set(gca,'fontsize',12);
xlim([0,1000])
title ('Error, t');



%x
clear 'w_n_est'
order = 2;

[ w_n_est, e_n_x ] = lpm_time_ar(alpha_x', 0.05, order )
x_axis = [1:length(w_n_est(1,:))];
 
subplot(255)
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
title ('Coefficients, x');
set(gca,'fontsize',12);
%%%legend('a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12','a13','a14','a15')
subplot(2,5,10)
plot([1:length(e_n_x)],e_n_x.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title ('Error, x');












%a
clear 'w_n_est'
order = 3;

[ w_n_est, e_n_x ] = lpm_time_ar(alpha_a', 0.1, order )
[ w_n_est_gs, e_n_x_gs ] = lpm_ar_gear_shift(alpha_a', 0.1, order )

x_axis = [1:length(w_n_est(1,:))];
f2 = figure
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
%%%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
title('a Coefficients, u = 0.1')
set(gca,'fontsize',12);
xlim([0,1000])

subplot(223)
plot([1:length(e_n_x)],e_n_x.^2)
ylabel('Error Magnitude');
xlabel('time');
set(gca,'fontsize',12);
title('Error')
xlim([0,1000])

subplot(222)
hold on;
tmp = [];
for i = 1 : order
    plot (x_axis,w_n_est_gs(i,:),'LineWidth',2); 
    hold on;
    tmp = cat(2,tmp,strcat('a',num2str(i)));
end
hold off
dim = 2*ones(1,order);
%legend(mat2cell(tmp,[1],dim));
ylabel('a Value Magnitude');
xlabel('time');
set(gca,'fontsize',12);
title('a Coefficients, gear shifting')
xlim([0,1000])

subplot(224)
plot([1:length(e_n_x_gs)],e_n_x_gs.^2)
ylabel('Error Magnitude');
xlabel('time');
xlim([0,1000])

set(gca,'fontsize',12);
title('Error')

R_p_a = 10 * log10(std(alpha_a)^2./std(e_n_a)^2)
R_p_e = 10 * log10(std(alpha_e)^2./std(e_n_e)^2)
R_p_s = 10 * log10(std(alpha_s)^2./std(e_n_s)^2)
R_p_t = 10 * log10(std(alpha_t)^2./std(e_n_t)^2)
R_p_x = 10 * log10(std(alpha_x)^2./std(e_n_x)^2)




