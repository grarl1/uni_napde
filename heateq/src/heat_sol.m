% Solution for the heat equation problem with:
%   - Initial value:  x(0) = x(1) = 0
%   - Boundary value: u_0  = x(1-x)
% 
% Parameters:
%   - x: vector of nodes. (J+1 x 1)
%   - t: time value. (1 x 1)
%   - iter: number of iterations for the truncated sum. (1 x 1)
%
% Return:
%   - Usol: vector of solution values. (J+1 x 1)
%
function [Usol] = heat_sol(x, t, iter)
    % Solution initialization
    Usol = zeros(length(x), 1);
    
    % Truncated sum
    for m = 1 : iter
        % B_m value.
        B_m = (-4*(-1)^m+4)/((pi*m)^3);
        
        % Sum term.
        sum_term = B_m * exp(-(m*pi)^2*t) * sin(m*pi*x);
        Usol(:,1) = Usol(:,1) + sum_term;
    end
end