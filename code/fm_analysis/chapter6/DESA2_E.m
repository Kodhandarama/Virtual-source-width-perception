% Objective: To obtain the Teager energy of the input signal

% Relevant reading: P Maragos, JF Kaiser and TF Quatieri, "On separating amplitude from frequency modulations
% using energy operators", Proc. IEEE Intl. Conf. on Acoustics, Speech and Sig. Proc., Vol. II, pp.1-4, 1992 

% Author: S Chandra Sekhar (PhD, ECE, IISc) and Jitendra Kumar Gupta

% Dependencies: none

% Send bug reports/fixes to whozchash@yahoo.com, bowschie@gmail.com

% Date of documentation: 05 Feb 2006

% =======================================================================================

% Input:
% x: real-valued signal

% Output: 
% E_x: TEO of x

% =======================================================================================


function E_x = DESA2_E(x);

L_x=length(x);
E_x=rand(1,L_x);
for ii=2:L_x-1
   n=ii;
   E_x(n)=x(n)*x(n)-x(n+1)*x(n-1);
end

E_x(1)=E_x(2);E_x(L_x)=E_x(L_x-1);

% At the boundaries of the input observation duration

% Done

