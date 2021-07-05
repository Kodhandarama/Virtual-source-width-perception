% Objective: Performance comparison of DESA-1 and ZC-AM/FM techniques for exponential AM and linear FM estimation

% Relevant reading: Figure 6.11, Page 119 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: zcappr.m, DESA1.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


% AM-FM signal generation
N=512;n=0:N-1;
am = exp(-1.2*n/N);
fm=0.1:0.1/(N-1):0.2;
pm=2*pi*cumsum(fm);

win=hamming(48)';
win=win/max(win);
am(1:24)=am(1:24).*win(1:24);
am(end-23:end)=am(end-23:end).*win(25:end);
amfm=am.*cos(pm);
sigstd=std(amfm);

% Bandpass noise generation parameters
L=256;	% bandpass filter length
b=fir1(L,[0.15 0.35]*2,'DC-0');
Q=24;t=Q+1:N-Q;

% Arrays to store the AM and FM results
% 1 for AM, 2 for FM
Dcmse1=[];Dcmse2=[];
Zcmse1=[];Zcmse2=[];

% SNR scale (finer spacing at low SNR and larger spacing at high SNR)
for SNR=[0:2:30 35:5:60 70 80]
D1=[];D2=[];
Z1=[];Z2=[];
for trials=1:100

SNR
trials

% bandpass noise generation
r=randn(1,N);
fr=conv(b,r);fr=fr(0.5*L+1:end-0.5*L);
fr=fr/std(fr);
noisy=amfm+sigstd*10^(-SNR/20)*fr;

% estimation
[d1,d2]=DESA1(noisy);
[z1,z2]=zcappr(noisy);z2=z2/(2*pi);

% error computation
D1=[D1;d1(t)-am(t)];D2=[D2;d2(t)-fm(t)];
Z1=[Z1;z1(t)-am(t)];Z2=[Z2;z2(t)-fm(t)];
end

% saving results
Dcmse1=[Dcmse1 sum(mean(D1.^2))];Dcmse2=[Dcmse2 sum(mean(D2.^2))];
Zcmse1=[Zcmse1 sum(mean(Z1.^2))];Zcmse2=[Zcmse2 sum(mean(Z2.^2))];
end

save twotechs2		% store for future use

% Plot rightaway
snr=[0:2:30 35:5:60 70 80];
subplot(121);
plot(snr,10*log10(Dcmse1),'k+-');
hold on
plot(snr,10*log10(Zcmse1),'ko-')
legend('DESA-1','ZC-AM/FM')
xlabel('SNR (dB)');
ylabel('Cumulative squared error, \eta_{AM} (dB)')

subplot(122);
plot(snr,10*log10(Dcmse2),'k+-');
hold on
plot(snr,10*log10(Zcmse2),'ko-')
legend('DESA-1','ZC-AM/FM')
xlabel('SNR (dB)');
ylabel('Cumulative squared error, \eta_{FM} (dB)')


% Done

