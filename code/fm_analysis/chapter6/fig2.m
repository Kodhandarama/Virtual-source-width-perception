% Objective: AM-FM signal generation and AM-FM estimation using the zero-crossing technique
% (in particular Fig 2 of the ICASSP paper referred below was generated using this program)

% Relevant reading: SC Sekhar and TV Sreenivas, "Novel approach to AM-FM decomposition with applications
% to speech and music analysis", Proc. IEEE Intl. Conf. on Acoustics, Speech and Signal Proc., 2004. 

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% thesisfig1.fig and thesisfig2.fig and corresponding .eps files in Chapter 6 of the thesis Tex directory have been
% generated using this program

% Dependencies: getzeros.m, knn.m, tvlpf.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================


N=512;		% signal length
n=0:1:N-1;	% discrete-time instants
L=512;		% TV filter length

am=1+0.75*sin(0.06125*n);	% AM	
beta=4;				% FM index
pm=pi*n/2+beta*sin(pi*n/100+pi/4);	% PM
fm=pi/2+beta*cos(pi*n/100+pi/4)*(pi/100);	% FM
win=hamming(48)';		% Window (to be used at either ends)
win=win/max(win);		% normalized window

% The following two code lines effectively simulate the trapezoid window
am(1:24)=am(1:24).*win(1:24);
am(end-23:end)=am(end-23:end).*win(25:end);

% AM-FM signal
amfm=am.*cos(pm);

% FM estimation using ZC information
deltan=n(2)-n(1);
zcs = getzeros(amfm,deltan);
zcs = zcs/N;

% Inst. phase corresponding to the zero-crossings
phis=(0:length(zcs)-1)*pi;

% parameters of the k-NN algorithm
p=3;k=11;

% FM estimation
FMest=knn(zcs,phis,k,n/N,p)/(N);

% PM estimation
PMest=cumsum(FMest);

% Coherent TV filtering
f1=tvlpf(amfm.*sin(PMest),FMest,L,N);	% In-phase component
f2=tvlpf(amfm.*cos(PMest),FMest,L,N);	% Quadrature component
envelope=2*sqrt(f1.^2+f2.^2);		% Envelope

% Plots

% AM
subplot(121);
plot(envelope);
hold on;
plot(am,'r');

% FM
subplot(122);
plot(FMest);
hold on;
plot(fm,'r')


% Error plots (only if desired, modify the if 1==2 to if 1==1 to plot)
if 1==2
subplot(221);plot(envelope)
axis([0 N-1 0 2.5])
xlabel('sample index');ylabel('envelope');
subplot(222);plot(FMest/(2*pi))
axis([0 N-1 0.2 0.3])
xlabel('sample index');ylabel('frequency');
subplot(223);plot(am-envelope)
axis([0 N-1 -4e-3 4e-3])
xlabel('sample index');ylabel('error in envelope');
subplot(224);plot((fm-FMest)/(2*pi))
axis([0 N-1 -0.0005 0.0005])
xlabel('sample index');ylabel('error in frequency');
synth=envelope.*cos(PMest);
end

% Done
