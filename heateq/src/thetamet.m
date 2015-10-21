% theta-method function for the heat equation problem with:
%   - Initial value:  x(0) = x(1) = 0
%   - Boundary value: u_0  = x(1-x)
%
% Parameters:
%   - theta: theta value in [0,1]. (1 x 1)
%   - J: number of nodes for the variable x. (1 x 1)
%   - tF: final time. (1 x 1)
%   - nu: value of Delta_t/(Delta_x^2). If nu is > 0
%         mu is ignored, otherwise nu is ignored. (1 x 1)
%   - mu: value of Delta_t/Delta_x. (1 x 1)
%
% Return:
%   - x: mesh for the variable x. (J+1 x 1)
%   - U: numerical approximation at time tF. (J+1 x 1)
%   - t_cpu: execution time. (1 x 1)
function [x, U, t_cpu] = thetamet(theta, J, tF, nu, mu)
    % Initialize N (number of nodes for the variable t)
    if nu > 0
        N = round(tF*J*J/nu);
    elseif mu > 0
        N = round(tF*J/mu);
        nu = mu*J;
    end
    
    % Initialize step sizes and variables
    dx = 1/(J);      % Step size for x
    x = (0:dx:1)';   % J+1 nodes
    dt = tF/(N);      % Step size for t
    t = (0:dt:tF)';   % N+1 nodes
    
    % Initialize U
    U = zeros(length(x), 1); % Initial value
    U(:, 1) = (x.*(1-x));   % Boundary value
    
    % Tridiagonal matrices
    A = tridiag(J-1, -nu*theta, 1+2*nu*theta, -nu*theta);
    B = tridiag(J-1, (1-theta)*nu, 1-(1-theta)*2*nu, (1-theta)*nu);
    AinvB = A\B;
    
    % Start stopwatch timer
    tic;
    
    % theta-method
    for t_n = 1 : N
      U(2:end-1, 1) = AinvB * U(2:end-1, 1);
    end

    % Read elapsed time from stopwatch
    t_cpu = toc;
end
