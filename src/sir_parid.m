% 
% Author: Filipe Pires
% NMEC: 85122
% Description: 
%   This code uses least squares to identify two parameters in the SIR model:
%   S_t = -beta*SI; I_t = beta*SI - gamma*I; R_t = gamma*I where beta = "contagious" coefficient and gamma = "recovery" coefficient.
%   The data is given in the vectors Sd, Id and Rd and they are adjusted by a random variable.
%   The data is used in the finite difference approximation of the above:
%   (S_i+1 - S_i-1)/(2 dt) = -beta S_i I_i
%   (I_i+1 - I_i-1)/(2 dt) = beta S_i I_i - gamma I_i and
%   (R_i+1 - R_i-1)/(2 dt) = gamma I_i.
%   Least squares is used to compute the linear polynomial coefficients.
%   Variable 'meas' tells how many of the first data points are used.
% Note:
%   The values present on the arrays Id and Rd are taken from Google
%   Trends, according to the topic they belong to.
% 

clear; clf(figure(1)); clc;
global old_beta old_gamma;
old_beta = 0.010; old_gamma = 0.100;

% Jordan Peterson Debate
td = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56];
Id = [3 5 5 3 3 4 7 6 8 57 54 56 39 51 52 80 99 48 43 46 47 63 57 50 39 42 38 22 36 44 32 29 21 18 12 20 20 26 32 25 19 14 11 12 18 18 13 13 10 19 10 17 20 6 11 19];
Rd = [0 0 0 2 2 1 0 1 0 0 3 1 18 6 5 0 0 51 56 53 52 36 42 49 60 57 61 77 63 55 67 70 78 81 87 79 79 73 67 74 80 85 88 87 81 81 86 86 89 80 89 82 79 93 88 80];
numdata = 56;
meas = 40;
tf = 56;

% Avengers Endgame
%td = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39];
%Id = [20 19 23 26 38 58 88 99 100 93 85 71 64 56 50 50 49 44 39 37 35 34 34 33 28 26 26 24 24 26 24 22 21 20 19 20 20 20 19];
%Rd = [0 1 0 0 0 0 0 0 0 7 15 29 36 44 50 50 51 56 61 63 65 66 66 67 72 74 74 76 76 74 76 78 79 80 81 80 80 80 81];
%numdata = 39;
%meas = 30;
%tf = 39;

% Notre Dame Fire
%td = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21];
%Id = [0 1 1 99 55 17 10 8 7 5 4 2 2 1 1 1 1 1 1 1 1 0];
%Rd = [0 0 0 0 44 82 89 91 92 94 95 97 97 98 98 98 98 98 98 98 98 99];
%numdata = 22;
%meas = 11;
%tf = 22;

% GoldieBlox This is Your Brain on Engineering
%td = [1 2  3 4 5 6 7  8 9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103];
%Id = [4 12 8 8 9 6 11 4 10 13 12 8  9  4  6  10 11 6  8  41 60 40 27 14 14 10 10 16 11 12 10 15 19 25 18 18 17 14 11 46 100 33 29 26 31 21 20 19 23 15 24 20 19 15 23 22 26 31 25 19 20 24 11 18 21 18 17 6 21 18 14 8 18 8 13 10 6 13 11 4 8 6 8 7 9 6 4 7 4 3 6 3 5 2 4 3 6 6 13 6 6 7 8];
%Rd = [0 0  4 4 3 6  1 8 2  0  1  5  4  9  7  3  2  7  5  0  0  20 33 46 46 50 50 44 49 48 50 45 41 35 42 42 43 46 49 14 0 100-33 100-29 100-26 100-31 100-21 100-20 100-19 100-23 100-15 100-24 100-20 100-19 100-15 100-23 100-22 100-26 100-31 100-25 100-19 100-20 100-24 100-11 100-18 100-21 100-18 100-17 100-6 100-21 100-18 100-14 100-8 100-18 100-8 100-13 100-10 100-6 100-13 100-11 100-4 100-8 100-6 100-8 100-7 100-9 100-6 100-4 100-7 100-4 100-3 100-6 100-3 100-5 100-2 100-4 100-3 100-6 100-6 100-13 100-6 100-6 100-7 100-8];
%numdata = 103;
%meas = 70;
%tf = 100;

rvec = rand(1,numdata);
Id(2:numdata) = Id(2:numdata) + .1*rvec(1,2:numdata) - .05;

rvec = rand(1,numdata);
Rd(2:numdata) = Rd(2:numdata) + .1*rvec(1,2:numdata) - .05;
Sd = 100 - Id - Rd;
%
for i = 2:1:numdata-1
     ii = (i-1)*3;
     d(ii) = (Sd(i+1) - Sd(i-1))/(td(i+1) - td(i-1));
     d(ii+1) = (Id(i+1) - Id(i-1))/(td(i+1) - td(i-1));
     d(ii+2) = (Rd(i+1) - Rd(i-1))/(td(i+1) - td(i-1));
     A(ii,1) = -Sd(i)*Id(i); A(ii,2) = 0;
     A(ii+1,1)= Sd(i)*Id(i); A(ii+1,2) = -Id(i);
     A(ii+2,1)= 0.0; A(ii+2,2) = Id(i);
end

m = 3*meas + 1;
x = A(2:m,:)\d(2:m)';

[old_beta old_gamma]
[x(1) x(2)]
plot(td(1:1:meas+1),Sd(1:1:meas+1),'*',td(1:1:meas+1),Id(1:1:meas+1),'o',...
 td(1:1:meas+1),Rd(1:1:meas+1),'s')%,td,Sd,'x',td,Id,'x',td,Rd,'x')
old_beta = x(1);
old_gamma = x(2);
[t y] = sirid(tf);  
hold on
plot(t, y(:,1), 'b',t, y(:,2), 'g',t,y(:,3), 'r')
legend('', '', '', 'susceptible', 'infected', 'recovered')
ylim([0 100])
