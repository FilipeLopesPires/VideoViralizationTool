% 
% Author: Filipe Pires
% NMEC: 85122
%

function [t y] = sirid(tf)
    yo = [99 1 0];
    to = 0;
    [t y] = ode45('ypsirid',[to tf],yo);