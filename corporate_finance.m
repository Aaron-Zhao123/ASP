%corporate finance

% DMM Model
% r and g are evaluted after the financial crisis
divident = [24.57 27.74 32.24 35.57 39.8 43.46];
year = [2010 : 1: 2015];

%http://www.multpl.com/s-p-500-dividend/table

price = [1123.58 1282.62 1300.58 1480.4 1822.36 2028.18];

g = [0.0145 0.1626 0.1825 0.1199 0.1272 0.1];

g_ave = mean(g);
div_2016 = 43.46

r =  divident./price + g_ave;

r_ave = mean(r);

Price_2016 = div_2016 / (1+r_ave) + div_2016 * (1+g_ave) / (1+r_ave).^ (2);
Continue_val = div_2016 * (1+g_ave).^2 + (div_2016 * (1+g_ave).^3 / (r_ave - g_ave)) /(1+r_ave)^3;

Price_2016 = Price_2016 + Continue_val;
% Current index is overvalued (1932)

% r and g are evaluted across all years
g_avg = 0.0599;
r_avg = 0.0913;
Price_2016_two = div_2016 / (1+r_ave) + div_2016 * (1+g_ave) / (1+r_ave).^ (2);
Continue_val = div_2016 * (1+g_ave).^2 + (div_2016 * (1+g_ave).^3 / (r_ave - g_ave)) /(1+r_ave)^3;

Price_2016_two = Price_2016_two + Continue_val;

