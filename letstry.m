N = length (x_t);
% construct an H matrix
f_base = [0:1/N:(N-1)/N];
for f = 1 : N
     for n = 1: N
         H(f,n) = exp(-j*2*pi*(f-1)*(n-1)/N);
     end
end
 x_fft = H * x_t;

 subplot(211)
 plot(abs(fft(x_t)))
 subplot(212)
 plot(abs(x_fft))