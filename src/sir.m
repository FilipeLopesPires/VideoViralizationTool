% 
% Author: Filipe Pires
% NMEC: 85122
% Description: 
%   This code calculates the curves of the 3 subsets of a population during
%   an infection outbreak according to the values of beta and gamma.
%

% prepare model
clear; clc;
to = 0;         % starting time
tf = 50;        % finishing time
yo = [99 1 0];  % population, where yo(1,1) is the susceptible population, yo(1,2) is the infected population and yo(1,3) is the recovered population

% calculate and plot graph
[t y] = ode45('ypsir',[to tf],yo);  % Matlab command used to appoximate the solution of our system of differential equation
plot(t,y(:,1),t,y(:,2),t,y(:,3))    % Matlab command used to generate the graphs of the three population groups
title('SIR Model')
legend('Susceptible', 'Infected', 'Recovered')
xlabel('time')
ylabel('susceptible, infected, recovered')

