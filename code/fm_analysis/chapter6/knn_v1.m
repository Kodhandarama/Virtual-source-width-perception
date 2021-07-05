% Objective: k-NN technique for IF estimation using zero-crossings

% Relevant reading: Section 6.1.1 on Page 107 of the thesis

% Author: S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% zcs: zero-crossings
% phis: instantaneous phase values at the zero-crossings
% k: no. of nearest neighbours to use in the algorithm
% n: time instants at which the estimate is desired
% p: order of the local polynomial fit (for k-nn)

% Output: 
% estimate: k-NN technique based IF estimate

% =======================================================================================

function [FM_l,FM_r] = knn_v1(zcs_ln,zcs_rn,phis_l,phis_r,k,n,p); 

FM_l=[];		% Array to store the instantaneous frequency estimates
for m=n			% for all time indices at which the IF is desired

d_l=abs(zcs_ln-m).^2;	% compute the distances to the zero-crossings
[val,ind_l]=sort(d_l);	% sort them to get the k-nearest ones

d_r=abs(zcs_rn-m).^2;	% compute the distances to the zero-crossings
[val,ind_r]=sort(d_r);	% sort them to get the k-nearest ones


g_c=polyfit([zcs_ln(ind_l(1:k)) zcs_rn(ind_r(1:k))],[phis_l(ind_l(1:k)) phis_r(ind_r(1:k))],p);

phi_h_r2 = polyval(g_r,zcs_rn(ind_r(1:k)));
h_l=polyval((p:-1:1).*g_c(1:p),m);	% sampling the derivative polynomial

FM_l=[FM_l h_l];		% k-NN technique based ZC-IF estimate
FM_r = FM_l
end

g_l=polyfit(zcs_ln(ind_l(1:k)),phis_l(ind_l(1:k)),p);	% local polynomial fit
g_r=polyfit(zcs_rn(ind_r(1:k)),phis_r(ind_r(1:k)),p);	% local polynomial fit
phi_l = phis_l(ind_l(1:k));
phi_h_l = polyval(g_l,zcs_ln(ind_l(1:k)));

phi_r2 = phis_r(ind_r(1:k));
phi_h_r2 = polyval(g_r,zcs_rn(ind_r(1:k)));

phi_r = phis_r(ind_l(1:k));
phi_h_r = polyval(g_l,zcs_rn(ind_l(1:k)));

% Done

