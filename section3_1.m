
figure 
subplot (1,3,1);
x_t = randn(128,1);
N = length (x_t);
[ P_f_one,f_one ] = pgm( x_t )
plot (f_one,P_f_one);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 128 samples')
set(gca,'fontsize',12)

subplot (1,3,2);
x_t = randn(128*2,1);
N = length (x_t);
[ P_f_two,f_two ] = pgm( x_t )
plot (f_two,P_f_two);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 256 samples')
set(gca,'fontsize',12)

subplot (1,3,3);
x_t = randn(128*4,1);
N = length (x_t);
[ P_f_three,f_three ] = pgm( x_t )
plot (f_three,P_f_three);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 512 samples')
set(gca,'fontsize',12)

p_filterd_one = filter (ones(5,1)*0.2,[1],P_f_one)
p_filterd_two = filter (ones(5,1)*0.2,[1],P_f_two)
p_filterd_three = filter (ones(5,1)*0.2,[1],P_f_three)

figure
subplot (131)
plot (f_one,p_filterd_one);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 128 samples')
set(gca,'fontsize',12)

subplot (132)
plot(f_two,p_filterd_two);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 256 samples')
set(gca,'fontsize',12)

subplot (133)
plot(f_three,p_filterd_three);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('PSD of WGN, 512 samples')
set(gca,'fontsize',12)

WGN = randn(1024,1);
WGN = reshape (WGN,8,128);
figure
for i = 1:8 
    subplot (4,2,i)
    [ P_f,f_WGN ] = pgm( WGN(i,:)' )
    P_filtered = filter(ones(5,1)*0.2,[1],P_f);
    plot(f_WGN,P_filtered);
    area(i) = trapz(f_WGN,P_filtered);
    avg(i) = mean(P_filtered);
    xlabel('normalized frequency')
    ylabel('PSD(W/HZ)')
    set(gca,'fontsize',12)

end

for i = 1:8
    [ P_f_new(i,:),f_WNG_avg ] = pgm(WGN(i,:)');
    P_f_new(i,:) = filter (ones(5,1)*0.2,[1],P_f_new(i,:));
end
figure
for i = 1:128
    P_f_avg(i) = sum(P_f_new(:,i))/8;
end
plot(f_WNG_avg,P_f_avg);
xlabel('normalized frequency')
ylabel('PSD(W/HZ)')
title('Averaged WGN over 1024 samples')
set(gca,'fontsize',12)

% 
% y = zeros(128,1);
% for m = 1:N
%     for n = 1:N
%         tmp = x_t(n)*exp(-j*2*pi*f_base(m)*n/N);
%         y(m) = y(m)+tmp;
%     end
%         y(m) = 1/N*abs(y(m));
% end

