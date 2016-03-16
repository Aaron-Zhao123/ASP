%test 
x = [-2:0.1:2];
y = x.^2;

plot (x,y)
scatter (x, min(y));
