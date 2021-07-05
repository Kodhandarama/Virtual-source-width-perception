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

function estimate = knn(zcs,phis,k,n,p); 

estimate=[];		% Array to store the instantaneous frequency estimates
for m=n			% for all time indices at which the IF is desired
distances=abs(zcs-m).^2;	% compute the distances to the zero-crossings
[val,ind]=sort(distances);	% sort them to get the k-nearest ones
g=polyfit(zcs(ind(1:k)),phis(ind(1:k)),p);	% local polynomial fit
h=polyval((p:-1:1).*g(1:p),m);	% sampling the derivative polynomial
estimate=[estimate h];		% k-NN technique based ZC-IF estimate
end

% Done

