% Blind source separation on sine waves

% Time from 1 to 100
t = 1:100;

% Sine waves
x = cos(3*pi/8 * t);
y = sin(pi/9 * t + pi/3);
fprintf('Source waves. Press Enter.\n');
plot(t,x,'r',t,y,'b');
pause

% Sine wave combinations
c1 = .3 * x + .7 * y;
c2 = .9 * x + .1 * y;
C = [c1; c2];
fprintf('Combinations. Press Enter.\n');
plot(t,c1,'r',t,c2,'b');
pause

% Compute the 4th order cumulants 
T = size(t, 2); % number of samples
N = size(C, 1); % number of sensors
Q = ((T*ones(N,1)*sum(abs(C).^2)).*C)*C' - C*C'*C*C' - C*C'*trace(C*C') - (C*C.')*conj(C*C.');

% BSS routine
[W, D] = eig(C*C',Q);
S = W'*C;
fprintf('Recovered Sources. Press Enter.\n');
plot(t,S(1,:),'r',t,S(2,:),'b');
pause
