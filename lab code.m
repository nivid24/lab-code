% Explicit method for 1-D steady state conduction
close all, clear all; clc;
% Input parameters
L = 10; %(m)
dx = 0.1; %(m) 
N = L/dx+1;
tol = 1e-2; %(m)
dt = 1; %(sec)

% Domain Discretisation
T_new = zeros(N); % %Initialising the Domain

x = linspace(0,dx,N); %x-coordinate

% Boundary Condition
for i=1:N
    T_new(1) = 38;
    T_new(N) = 48;
end

%Main Loop - Logic
error =1;iter=0;
while(error > tol)
     iter=iter+1;
        T = T_new;
        for i=2:N-1
            T_new(i) = (T(i+1) + T(i-1))/2;
        end
        error = max(abs(T-T_new));
figure(2);
%plotting
     plot(T_new); shading flat;colorbar;
xlabel('x');
pause(0.1);
end


