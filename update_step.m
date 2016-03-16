function [ u_out, phi ] = update_step( u_in,e_n,ep,xc,xp,phi)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
up = u_in;
p = 0.05;
alpha = 0.2;

phi = alpha*phi + ep*xp;

u_out = u_in + p*e_n*xc'*phi;

end

