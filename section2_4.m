a_1 = -2.5 + 5 *rand(1000,1);
a_2 = -1.5 + 3 *rand(1000,1);
wgn = randn(1000,1);

for i = 1:1000
    y(:,i) = filter ([1],[1,-a_1(i,1),-a_2(i,1)],wgn);
end
% each column of y is a variable
j = 1;
for i = 1: 1000
    if (abs(y(1000,i))<10)
        plot(a_1(i),a_2(i),'*');hold on
    end
end

xlim([-3,3]);
ylim([-2,2]);

x_axis = [2 -2 0 2];
y_axis =[-1 -1 1 -1];
line ('XData',x_axis,'YData',y_axis);
xlabel('a1');
ylabel('a2');
set(gca,'fontsize',12)
