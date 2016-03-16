function [ w_n, e_n ] = lpm( x_n, z_n, mu, N_w )
%lpm
% x is N*Nw+1 matrix
% z_n is a vector
N= length(z_n);
w_n(:,1) = zeros(N_w,1);
for i = 1:N
    e_n(i) = z_n(i) - w_n(:,i)' * x_n(i,:)';
    w_n(:,i+1) = w_n(:,i) + mu.* e_n(i) .* x_n(i,:)';

end

