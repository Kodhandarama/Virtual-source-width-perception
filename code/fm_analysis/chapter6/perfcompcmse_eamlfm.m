% Objective: Performance comparison of all algorithms for AM-FM computation 

% Relevant reading: see perfcompcmse.m

% Line to line same as perfcompcmse.m except for exponential AM and linear FM
% See comments in perfcompcmse.m to understand the code below

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: DESA1.m, zcappr.m, HT.m, Aud_L.m, PTFD.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


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

fm=fm/(2*pi);
L=256;	% bandpass filter length
b=fir1(L,[0.15 0.35]*2,'DC-0');
Q=24;t=Q+1:N-Q;

% 1 for AM, 2 for FM
Dcmse1=[];Dcmse2=[];
Zcmse1=[];Zcmse2=[];
Hcmse1=[];Hcmse2=[];
Acmse1=[];Acmse2=[];
Pcmse1=[];Pcmse2=[];

for SNR=0:2:30
D1=[];D2=[];
Z1=[];Z2=[];
H1=[];H2=[];
A1=[];A2=[];
P1=[];P2=[];
for trials=1:100
SNR
trials
r=randn(1,N);
fr=conv(b,r);fr=fr(0.5*L+1:end-0.5*L);
fr=fr/std(fr);
noisy=amfm+sigstd*10^(-SNR/20)*fr;
[d1,d2]=DESA1(noisy);
[z1,z2]=zcappr(noisy);z2=z2/(2*pi);
[h1,h2]=HT(noisy);
[a1,a2]=Aud_L(noisy);
[p1,p2]=PTFD(noisy);
D1=[D1;d1(t)-am(t)];D2=[D2;d2(t)-fm(t)];
Z1=[Z1;z1(t)-am(t)];Z2=[Z2;z2(t)-fm(t)];
H1=[H1;h1(t)-am(t)];H2=[H2;h2(t)-fm(t)];
A1=[A1;a1(t)-am(t)];A2=[A2;a2(t)-fm(t)];
P1=[P1;p1(t)-am(t+1)];P2=[P2;p2(t)-fm(t+1)];
end
Dcmse1=[Dcmse1 sum(mean(D1.^2))];Dcmse2=[Dcmse2 sum(mean(D2.^2))];
Zcmse1=[Zcmse1 sum(mean(Z1.^2))];Zcmse2=[Zcmse2 sum(mean(Z2.^2))];
Hcmse1=[Hcmse1 sum(mean(H1.^2))];Hcmse2=[Hcmse2 sum(mean(H2.^2))];
Acmse1=[Acmse1 sum(mean(A1.^2))];Acmse2=[Acmse2 sum(mean(A2.^2))];
Pcmse1=[Pcmse1 sum(mean(P1.^2))];Pcmse2=[Pcmse2 sum(mean(P2.^2))];
end

save perfcompcmse_eamlfm
% this is for cumulative mean square error

snr=0:2:30;
subplot(121);
plot(snr,10*log10(Dcmse1),'k+-');hold on
plot(snr,10*log10(Acmse1),'k*-')
plot(snr,10*log10(Hcmse1),'kd-')
plot(snr,10*log10(Pcmse1),'k--')
plot(snr,10*log10(Zcmse1),'ko-')
legend('DESA-1','AUD','AS','PTFD','ZC-AM/FM')
xlabel('SNR (dB)');ylabel('Cumulative squared error, \eta_{AM} (dB)')

subplot(122);
plot(snr,10*log10(Dcmse2),'k+-');hold on
plot(snr,10*log10(Acmse2),'k*-')
plot(snr,10*log10(Hcmse2),'kd-')
plot(snr,10*log10(Pcmse2),'k--')
plot(snr,10*log10(Zcmse2),'ko-')
legend('DESA-1','AUD','AS','PTFD','ZC-AM/FM')
xlabel('SNR (dB)');ylabel('Cumulative squared error, \eta_{FM} (dB)')

