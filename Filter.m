fsamp=50*10^6;
fcuts=[4*10^6 9*10^6];
mags=[1 0];
rs=0.01;
rp=0.05;
devs=[(10^(rp/20-1))/(10^(rp/20+1)) 10^(-rs/20)];

[n,f0,a0,w]=remezord(fcuts,mags,devs,fsamp); 
h=remez(n,f0,a0,w); %%расчет фильтра (ИХ) по алгоритму Ремеза

[hz,f]=freqz(h,1,1024,fsamp);

subplot(2,2,1)
plot(f,(abs(hz))),grid on;
xlim([0 50*10^6])

subplot(2,2,2)
plot(f,abs(hz)),grid on;
ylim([0.95 1.05])
xlim([0 5*10^6])

d=9;
M=2^(d-1);
hft=round(h*M);

[hftz,f]=freqz(hft/M,1,1024,fsamp);

subplot(2,2,3)
plot(f, abs(hftz)),grid on;
xlim([0 50*10^6])

subplot(2,2,4)
plot(f,abs(hftz)),grid on;
ylim([0.95 1.05])
xlim([0 5*10^6])


