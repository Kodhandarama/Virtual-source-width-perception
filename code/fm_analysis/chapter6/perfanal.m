% Objective: Performance of ZC and TEO estimators of AM and FM

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: getzeros.m, knn.m, tvlpf.m, 

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


N=512;
n=0:N-1;
L=512;
p=3;k=11;		% k-NN technique (for FM estimation) parameters

AMerr1=[];FMerr1=[];	% for ZC
AMerr2=[];FMerr2=[];	% for DESA-1
mu=0.5;			% AM indeX

for beta=2:7

AMffm1=[];FMffm1=[];
AMffm2=[];FMffm2=[];

for ffm=1./(10:-1:5)
beta			% FM index
ffm

% AM-FM signal generation
am=1+mu*sin(ffm*n);
pm=pi*n*ffm+beta*sin(pi*n/100+pi/4);
fm=pi*ffm+beta*cos(pi*n/100+pi/4)*(pi/100);
win=hamming(48)';
win=win/max(win);
am(1:24)=am(1:24).*win(1:24);
am(end-23:end)=am(end-23:end).*win(25:end);
amfm=am.*cos(pm);

% ZC Approach
deltan=n(2)-n(1);
zcs = getzeros(amfm,deltan); zcs=zcs/N;
phis=(0:length(zcs)-1)*pi;
FMest=knn(zcs,phis,k,n/N,p)/(N);

% PM estimation
PMest=cumsum(FMest);

% I and Q phase components
f1=tvlpf(amfm.*sin(PMest),FMest,L,N);
f2=tvlpf(amfm.*cos(PMest),FMest,L,N);

% Envelope
envelope=2*sqrt(f1.^2+f2.^2);

AMffm1=[AMffm1 mean((am(25:end-23)-envelope(25:end-23)).^2)];
FMffm1=[FMffm1 mean((fm(25:end-23)-FMest(25:end-23)).^2)];

% DESA-1
[estam,estfm]=DESA1(amfm);
estfm=estfm*2*pi;
AMffm2=[AMffm2 mean((am(25:end-23)-estam(25:end-23)).^2)];
FMffm2=[FMffm2 mean((fm(25:end-23)-estfm(25:end-23)).^2)];

end

AMerr1=[AMerr1;AMffm1];FMerr1=[FMerr1;FMffm1];
AMerr2=[AMerr2;AMffm2];FMerr2=[FMerr2;FMffm2];

end

FMerr2=real(FMerr2);
ffm=1./(10:-1:5);beta=2:7;

subplot(221);
mesh(ffm,beta,10*log10(AMerr1));
ylabel('\beta');
xlabel('\omega_{FM} (rad/s)');
zlabel('\xi_{AM}');
title('New Approach')
axis([ffm(1) ffm(end) beta(1) beta(end) -70 0])

subplot(223);
mesh(ffm,beta,10*log10(FMerr1));
ylabel('\beta');
xlabel('\omega_{FM} (rad/s)');
zlabel('\xi_{FM}');
axis([ffm(1) ffm(end) beta(1) beta(end) -80 0])

subplot(222);
mesh(ffm,beta,10*log10(AMerr2));
ylabel('\beta');
xlabel('\omega_{FM} (rad/s)');
zlabel('\xi_{AM}');
title('DESA-1')
axis([ffm(1) ffm(end) beta(1) beta(end) -70 0])

subplot(224);
mesh(ffm,beta,10*log10(FMerr2));
ylabel('\beta');
xlabel('\omega_{FM} (rad/s)');
zlabel('\xi_{FM}');
axis([ffm(1) ffm(end) beta(1) beta(end) -80 0])


% Done


