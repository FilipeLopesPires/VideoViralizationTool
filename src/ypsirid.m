% 
% Author: Filipe Pires
% NMEC: 85122
%

function ypsirid = ypsirid(t,y)
	global old_beta old_gamma
	ypsirid(1) = -old_beta*y(1)*y(2);
	ypsirid(2) = old_beta*y(1)*y(2) - old_gamma*y(2);
	ypsirid(3) = old_gamma*y(2);
    ypsirid = [ypsirid(1) ypsirid(2) ypsirid(3)]';