% 
% Author: Filipe Pires
% NMEC: 85122
% Description: 
%   This subroutine is used in the ode45 to generate the population curves.
%

function ypsir =ypsir(t,y)
    beta = .01;     % "contagious" coefficient - defines how fast is the infection process
    gamma = .1;     % "recovery" coefficient - defines how fast is the recovery process
    ypsir(1) =-beta*y(1)*y(2);
    ypsir(2) = beta*y(1)*y(2)-gamma*y(2);
    ypsir(3) = gamma*y(2);
    ypsir = [ypsir(1) ypsir(2) ypsir(3)]';