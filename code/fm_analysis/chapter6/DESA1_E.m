% Objective: Teager Energy operator computation

% Relevant reading: Sec.1.3.4 on Page 15 of the thesis

% Authors: Jitendra Kumar Gupta and S Chandra Sekhar, PhD scholar, ECE, IISc

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% x: input signal

% Output: 
% E_x: TEO of x

% =======================================================================================


function [E_x]=DESA1_E(x);

x_len=length(x);
E_x=zeros(1,x_len); 

% Straightforward implementation of TEO
for ii=2:x_len-1
    E_x(ii)=x(ii)*x(ii)-x(ii+1)*x(ii-1);
end

E_x(1)=E_x(2);   			% Initial and final values (arbitrary)
E_x(x_len)=E_x(x_len-1);

% Done

