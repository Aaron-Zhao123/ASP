function [ u_out ] = update_step_arbitary( u_in,i)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (mod(i,300) == 0)
    u_out = u_in/2;
else 
    u_out = u_in;
end

end

