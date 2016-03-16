%section 4_1
WGN = randn (1000,1);
b = [1,2,3,2,1];
a = [1];
y_n = filter(b,a,WGN);

y_norm = y_n ./ std(y_n);
w_n = 2*randn(1000,1);
z_n = y_norm + w_n;
[WGN_corre,x_wgn] = xcorr(WGN,'unbiased');
pos_zero = find(x_wgn == 0);
W_width = 5;
for i = 1: W_width
    for j = 1:W_width
        R_xx(i,j) = WGN_corre(abs(i-j)+pos_zero);
    end
end

[p_corre,x_corre] = xcorr(z_n,WGN,'unbiased');
pos_zero = find(x_corre == 0);
p_zx = p_corre(pos_zero:pos_zero+W_width-1);
w_opt = inv(R_xx) * p_zx;

% SNR cal
Signalsnr = snr(y_norm,w_n)
disp(w_opt)
disp(Signalsnr)