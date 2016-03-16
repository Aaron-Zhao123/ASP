x = randn(1000,1);
y = filter ([1],[1,-0.5,0.3],x);
for i = 1: 10
    [y_est,e2_tmp(i)] = aryule(y,i);
    stem ((i),(-y(i+1)),'b'); hold on 
    if (i == 1)
        e2(i) = e2_tmp(i); 
    end
    if (i > 1) 
        e2(i) = e2(i-1) + e2_tmp(i);
    end
end
N = length (y);
for i = 1: 10
    MDL(i) = log(abs(e2_tmp(i))) + i*log(N)/N;
    AIC(i) = log(abs(e2_tmp(i))) + 2*i/N;
end
figure
subplot (2,1,1);
plot ([1:10], MDL);
subplot (2,1,2);
plot ([1:10], AIC);