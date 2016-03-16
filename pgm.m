function [ P_f,f_base ] = pgm( x_t )
N = length (x_t);
% construct an H matrix
f_base = [0:1/N:(N-1)/N];

for f = 1 : N
     for n = 1: N
         H(f,n) = exp(-j*2*pi*(f-1)*(n-1)/N);
     end
end

%z = fft (x_t)

x_fft = H * x_t;
P_f = 1/N .* (abs(x_fft).^2);

end

