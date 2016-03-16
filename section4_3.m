%section 4_3
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

[ w_n_est, e_n ] = lpm_time_var( x_n_in, z_n, 0.2, length(b) )
[ w_n_est_org, e_n_org ] = lpm( x_n_in, z_n, 0.2, length(b) )

x_axis = [1:length(w_n_est(1,:))];
f1 = figure
subplot(221)
plot (x_axis,w_n_est(1,:),x_axis,w_n_est(2,:),x_axis,w_n_est(3,:),x_axis,w_n_est(4,:),x_axis,w_n_est(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
set(gca,'fontsize',12);
title('b coefficients, Ang & Farhang model')
xlim([1,1000])

subplot(223)
for i = 1 : length(w_n_est(1,:))
    MSE(i) = 1/2 * immse(b',w_n_est(:,i));
end
plot([1:length(e_n)],e_n'.^2,'Linewidth',2);
%plot([1:length(MSE)],MSE);
set(gca,'fontsize',12);
ylim([0,0.1])
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, varying u');
set(gca,'fontsize',12);
%xlim([200,1000])
subplot(222)
plot (x_axis,w_n_est_org(1,:),x_axis,w_n_est_org(2,:),x_axis,w_n_est_org(3,:),x_axis,w_n_est_org(4,:),x_axis,w_n_est_org(5,:),'LineWidth',2)
legend('b1','b2','b3','b4','b5');
ylabel('b Value Magnitude');
xlabel('time');
set(gca,'fontsize',12);
title('b coefficients, u remians at 0.2')
xlim([1,1000])


subplot(224)
for i = 1 : length(w_n_est_org(1,:))
    MSE_org(i) = 1/2 * immse(b',w_n_est_org(:,i));
end
plot([1:length(e_n)],e_n_org'.^2,'Linewidth',2);
%plot([1:length(MSE_org)],MSE_org);
set(gca,'fontsize',12);
ylim([0,0.1])
ylabel('Magnitude');
xlabel('time');
xlim([1,1000])
title('Error Magnitude, constant u');
set(gca,'fontsize',12);

fig_typ = '.eps';
hgexport(f1, ['figure4_3_3' fig_typ]); 

        