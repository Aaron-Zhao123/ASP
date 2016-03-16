
[pgm_lchannel,f_lchannel ] = pgm( s2h(:,1) );
[pgm_rchannel,f_rchannel ] = pgm( s2h(:,2) );

f1 = figure(1)

subplot(121)
plot(f_lchannel, pgm_lchannel);
subplot(122)
plot(f_rchannel, pgm_rchannel);