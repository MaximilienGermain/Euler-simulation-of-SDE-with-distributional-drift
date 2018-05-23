% To fix omega, we must fix startNT, start, and Kmax
X0 = 1;
startNT = 1;
startN = 1; 
NT = 6; % Time grid precision 2^(-N)
N = 3; % Space grid precision 2^(-N)
T = 1.2;
Kmax = startN+9;
Nx = 1+Kmax*2^(startN+2); % 2 times more precise than the grid for b^N
H = 0.85;
graphHaar = 0;
control = 0;
testId = 0;
[xgrid,B,M] = createfBm(H,Kmax,N,startN,Nx,-Kmax,1000);

% graphHaar = 1;
% control = 0;
% X = eulerMethod(X0,startNT,NT,N,T,H,B,xgrid,testId,Kmax,graphHaar,control);

% Test with b=id
% testId = 1;
% graphHaar = 1;
% B = linspace(-Kmax,Kmax,1+Kmax*2^(N+2));
% X = eulerMethod(X0,startNT,NT,N,T,H,B.^2/2,B,testId,Kmax,graphHaar,control);

% Convergence in n
frames = [];
for NT=2:10
    startNT = 2;
    %control = 1;
    %graphHaar = 1;
    [X,frame] = eulerMethod(X0,startNT,NT,N,T,H,B,xgrid,testId,Kmax,graphHaar,control);
    frames = [frames frame];
end
video('essai',frames)

% Convergence in N
% for N=startN:startN+9
%     [xgrid,B,M] = createfBm(H,Kmax,7,start,Nx,-Kmax,1000);
%     NT = 8;
%     control = 1;
%     X = eulerMethod(X0,startNT,NT,N,T,H,B,xgrid,testId,Kmax,graphHaar,control);
% end