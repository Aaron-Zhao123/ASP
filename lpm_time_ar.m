function [ w_n, e_n ] = lpm_time_ar( x_n, mu, N_w )
%lpm
% x is N*Nw+1 matrix
% z_n is a vector
N= length(x_n);
w_n = zeros(N_w,N);
for i = 1+N_w:N
   % mu = update_step_arbitary( mu,i)

    e_n(i) = x_n(i) - (w_n(:,i)' * x_n(i-1:-1:i-N_w));
    w_n(:,i+1) = w_n(:,i) + mu.* e_n(i) .* x_n(i-1:-1:i-N_w);


end

