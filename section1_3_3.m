M = 100;
N = 1000;
for i = 1 :M
    v1 = rp1(M,20*i);
    [f1(i,:),xs1(i,:)] = ksdensity (v1(i,:));
end

pic1 = figure
subplot(1,2,1)
for i = 1:100
    scatter3 (i.*ones(1,100),xs1(i,:),f1(i,:)); hold on
end
xlabel('Realizations');
ylabel('Random Variable V1');
zlabel('Probability');
title('Pdf plot of v1 using ksdensity')
set(gca,'fontsize',12);

subplot(1,2,2)
for i = 1:M
    pd= makedist('Uniform','lower',0,'upper',20*i*0.02);
    x = [-0.1:0.1:20*i*0.02+0.1];
    y_value = pdf(pd,x);
    plot3 (i.*ones(1,length(x)),x,y_value);hold on 
end
grid on
xlabel('Realizations');
ylabel('Random Variable V1');
zlabel('Probability');
title('Theoretical pdf plot of v1')
set(gca,'fontsize',12);



