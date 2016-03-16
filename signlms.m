function [ w_n_error,w_n_regressor, w_n_sign, e_n_error, e_n_regressor,e_n_sign ] = signlms(x_n, mu, N_w )

N= length(x_n);
w_n_error = zeros(N_w,N);
w_n_regressor = zeros(N_w,N);
w_n_sign = zeros(N_w,N);

for i = 1+N_w:N
    e_n_error(i) = x_n(i) - (w_n_error(:,i)' * x_n(i-1:-1:i-N_w));
    e_n_regressor(i) = x_n(i) - (w_n_regressor(:,i)' * x_n(i-1:-1:i-N_w));
    e_n_sign(i) = x_n(i) - (w_n_regressor(:,i)' * x_n(i-1:-1:i-N_w));

    w_n_error(:,i+1) = w_n_error(:,i) + mu.* sign(e_n_error(i)) .* x_n(i-1:-1:i-N_w);
    
    w_n_regressor(:,i+1) = w_n_regressor(:,i) + mu.* e_n_regressor(i) .* sign(x_n(i-1:-1:i-N_w));
    w_n_sign(:,i+1) = w_n_sign(:,i) + mu.* sign(e_n_sign(i)) .* sign(x_n(i-1:-1:i-N_w));
    
end
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here


end

