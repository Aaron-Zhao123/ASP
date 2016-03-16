%section 4_2
WGN = randn (1000,1);
b = [1,2,3,2,1];
a = [1];
y_n = filter(b,a,WGN);
y_norm = y_n/std(y_n);
w_n = 0.01*randn(1000,1);
z_n = y_norm + w_n;
for i = 1:length(z_n)
    if (i <= length(b))
        x_n_in(i,:) = cat(2,fliplr(WGN(1:i)'),zeros(1,length(b)-i));
    else
        disp(i)
        x_n_in(i,:) = fliplr(WGN((i-length(b)+1):i))';
    end
end

[ w_n_est, e_n ] = lpm( x_n_in, z_n, 0.01, length(b) )

x_axis = [1:length(w_n_est(1,:))];
f1=figure
subplot(131)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
title('Estimation of b coefficients')
set(gca,'fontsize',12);
xlim([1,1000])

for i = 1 : length(w_n_est(1,:))
    MSE(i) = 1/2 * immse(b',w_n_est(:,i));
end
subplot(132)
plot(x_axis,MSE);
xlim([1,1000])

ylabel('Magnitude');
xlabel('time');
title('Cost function');
subplot(133)
plot([1:length(e_n)],e_n'.^2);
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude');
fig_typ = '.eps';
hgexport(f1, ['figure4_2_1' fig_typ]); 

% varying step size

[ w_n_est, e_n ] = lpm( x_n_in, z_n, 0.002, length(b) )

x_axis = [1:length(w_n_est(1,:))];
f2=figure
subplot(241)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
title('b coefficients, u = 0.002')
set(gca,'fontsize',12);
xlim([1,1000])

subplot(245)
plot([1:length(e_n)],e_n'.^2,'Linewidth',2);
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, u = 0.002');
set(gca,'fontsize',12);


% 0.02
[ w_n_est, e_n ] = lpm( x_n_in, z_n, 0.02, length(b) )

x_axis = [1:length(w_n_est(1,:))];
subplot(242)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
title('b coefficients, u = 0.02')
set(gca,'fontsize',12);
xlim([1,1000])

subplot(246)
plot([1:length(e_n)],e_n'.^2,'Linewidth',2);
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, u = 0.02');
set(gca,'fontsize',12);

% 0.2
[ w_n_est, e_n ] = lpm( x_n_in, z_n, 0.2, length(b) )

x_axis = [1:length(w_n_est(1,:))];
subplot(243)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
title('b coefficients, u = 0.2')
set(gca,'fontsize',12);
xlim([1,1000])

subplot(247)
plot([1:length(e_n)],e_n'.^2,'Linewidth',2);
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, u = 0.2');
set(gca,'fontsize',12);

% 0.5
[ w_n_est, e_n ] = lpm( x_n_in, z_n, 0.5, length(b) )

x_axis = [1:length(w_n_est(1,:))];
subplot(244)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
title('b coefficients, u = 0.5')
set(gca,'fontsize',12);
xlim([1,1000])

subplot(248)
plot([1:length(e_n)],e_n'.^2,'Linewidth',2);
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, u = 0.5');
set(gca,'fontsize',12);




fig_typ = '.eps';
hgexport(f2, ['figure4_2_2' fig_typ]); 

