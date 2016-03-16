function [ w_n, e_n ] = lpm_ar_gear_shift( x_n, mu, N_w )
%lpm
% x is N*Nw+1 matrix
% z_n is a vector

N= length(x_n);
w_n = zeros(N_w,N);
for i = 1+N_w:N
    %mu = update_step_arbitary( mu,i)
    e_n(i) = x_n(i) - (w_n(:,i)' * x_n(i-1:-1:i-N_w));
    w_n(:,i+1) = w_n(:,i) + mu.* e_n(i) .* x_n(i-1:-1:i-N_w);    
    if i == 1+N_w
        [ mu, phi ] = update_step(mu,e_n(i),0,x_n(i),0,0);
    else 
        [ mu, phi ] = update_step(mu,e_n(i),e_n(i-1),x_n(i),x_n(i-1),phi);
    end

end

