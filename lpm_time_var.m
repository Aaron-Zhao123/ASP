function [ w_n, e_n ] = lpm_time_var( x_n, z_n, mu, N_w )
%lpm
% x is N*Nw+1 matrix
% z_n is a vector
N= length(z_n);
w_n(:,1) = zeros(N_w,1);
a = 0.01;
b = 0.05;
for i = 1:N
    %mu = update_step_arbitary( mu,i)
    e_n(i) = z_n(i) - w_n(:,i)' * x_n(i,:)';
    w_n(:,i+1) = w_n(:,i) + mu.* e_n(i) .* x_n(i,:)';
    
%     mu = a.*e_n(i) + b;
%     if (mu < 0.002)
%         mu = 0.002
%     elseif (mu > 0.2)
%         mu = 0.2
%     end
%     disp(mu)
    if i ==1 
        [ mu, phi ] = update_step(mu,e_n(i),0,x_n(i),0,0);
    else 
        [ mu, phi ] = update_step(mu,e_n(i),e_n(i-1),x_n(i),x_n(i-1),phi);
    end
end
end

