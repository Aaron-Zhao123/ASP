phone_num = randi([0,9],10,1);
phone_num = cat (1,[0;2;0],phone_num);
f1 = [1209 1336 1477];
f2 = [697 770 852 941];

%digital freq = f/ fs
fs = 32768;
Ts = 1/fs;
t=[0:Ts:0.25]
y_1 = sin(2*pi*f1(1)*t) + sin(2*pi*f2(1)*t);
y_2 = sin(2*pi*f1(2)*t) + sin(2*pi*f2(1)*t);
y_3 = sin(2*pi*f1(3)*t) + sin(2*pi*f2(1)*t);
y_4 = sin(2*pi*f1(1)*t) + sin(2*pi*f2(2)*t);
y_5 = sin(2*pi*f1(2)*t) + sin(2*pi*f2(2)*t);
y_6 = sin(2*pi*f1(3)*t) + sin(2*pi*f2(2)*t);
y_7 = sin(2*pi*f1(1)*t) + sin(2*pi*f2(3)*t);
y_8 = sin(2*pi*f1(2)*t) + sin(2*pi*f2(3)*t);
y_9 = sin(2*pi*f1(3)*t) + sin(2*pi*f2(3)*t);
y_0 = sin(2*pi*f1(1)*t) + sin(2*pi*f2(4)*t);
y_idle = sin(2*pi*0*t) + sin(2*pi*0*t);

y = [];
for i = 1 : length(phone_num)
    if (phone_num(i) == 0)
        y = cat (2,y,y_0);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 1)
        y = cat (2,y,y_1);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 2)
        y = cat (2,y,y_2);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 3)
        y = cat (2,y,y_3);
        y = cat (2,y,y_idle);
    end        
    if (phone_num(i) == 4)
        y = cat (2,y,y_4);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 5)
        y = cat (2,y,y_5);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 6)
        y = cat (2,y,y_6);
        y = cat (2,y,y_idle);
    end
    if (phone_num(i) == 7)
        y = cat (2,y,y_7);
        y = cat (2,y,y_idle);
    end   
    if (phone_num(i) == 8)
        y = cat (2,y,y_8);
        y = cat (2,y,y_idle);
    end    
    if (phone_num(i) == 9)
        y = cat (2,y,y_9);
        y = cat (2,y,y_idle);
    end    
end
    
figure   
plot (t,y_1,'b',t,y_2,'r',t,y_idle,'g')
xlim ([0.1,0.11]);
legend('y_1','y_2','y_idle')
xlabel('Time')
ylabel('Magnitude')
set(gca,'fontsize',12)
figure 
range_one = 1;
range_two = length(y_0);
% for i = 1 : 21
%     subplot(11,2,i)
%     spectrogram(y(1,range_one:range_two));
%     range_one = range_two + 1;
%     range_two = range_one + length(y_0) - 1;
%     xlim([0.03,0.1]);
% end
spectrogram(y,hanning(length(y_0)/2),1,[],fs)
xlim([600,1600])
title('Spectrogram of y sequence with low SNR')
% adding white noise
y_new = y + 10*randn(1,length(y));
figure
subplot(131)
spectrogram(y_new,hanning(length(y_0)/2),1,[],fs)
%spectrogram(y_new,length(y_0)/2,1,[],fs)
xlim([600,1600])
title('Spectrogram of y sequence with low SNR')
y_new = y + randn(1,length(y));
subplot(132)
spectrogram(y_new,hanning(length(y_0)/2),1,[],fs)
%spectrogram(y_new,length(y_0)/2,1,[],fs)
xlim([600,1600])
title('Spectrogram of y sequence with medium SNR')
y_new = y + 0.1*randn(1,length(y));
subplot(133)
spectrogram(y_new,hanning(length(y_0)/2),1,[],fs)
%spectrogram(y_new,length(y_0)/2,1,[],fs)
xlim([600,1600])
title('Spectrogram of y sequence with high SNR')

fig_typ = '.eps';
hgexport(f1, ['figure3_2_3' fig_typ]); 
