% Objective: To obtain the envelope and frequency of an AM-FM signal

% Relevant reading: Sections 6.1 and 6.2, Pages 107-113 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: getzeros.m, knn.m, tvlpf.m

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% amfm: AM-FM signal

% Output: 
% AMest: Estimated envelope/AM
% FMest: Estimated frequency/FM

% =======================================================================================

%function [AMest,FMest] = zcappr_v1(amfm);
function [zcs] = zcappr_v1(amfm,fs);

N=length(amfm);	% Length of the observed signal
n=0:N-1;	% discrete-time instants
L=512;		% Impulse response length of the time-varying filter (at each instant, this is the length)

% p: order of the polynomial, k: no. of nearest neighbours in the k-NN algorithm

%p=3;k=31;	% works well for audio
p=3;k=11;	% works for speech

% FM estimation using ZC information
deltan=n(2)-n(1);	% sampling period
%[fi,zcs]=fn_zcrs(amfm,deltan);	% get the zero-crossings of the AMFM signal
zcs=getzeros(amfm,deltan);	% get the zero-crossings of the AMFM signal
if_est = fs/2./diff(zcs);
%zcs=zcs/N;
%phis=(0:length(zcs)-1)*pi;	% corresponding instantaneous phase values
%FMest=knn(zcs,phis,k,n/N,p)/(N);	% use the zeros, phase values and interpolate to compute the 
	 				% FM using a k-NN algorithm
%PMest=cumsum(FMest);		% Instantaneous phase obtained by (discrete-time) integration of FM

% Coherent TV filtering
%f1=tvlpf(amfm.*sin(PMest),FMest,L,N);	% In-phase component (Time-varying filtering)
%f2=tvlpf(amfm.*cos(PMest),FMest,L,N);	% Quadrature-phase component (Time-varying filtering)
%AMest=2*sqrt(f1.^2+f2.^2);		% Envelope

% Done

