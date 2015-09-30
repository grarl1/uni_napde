% Returns a tridiagonal matrix.
% 
% Parameters:
%   -n: number of rows and columns.
%   -da: value for the diagonal above.
%   -d:  value for the main diagonal.
%   -db: value for the diagonal below.
%
% Retorno:
%   -tridiag: tridiagonal matrix.
function [tridiag] = tridiag(n, da, d, db)

    % Main diagonal.
    diag = repmat(d, n, 1);
  
    % Diagonal above and below.
    diag_a = repmat(da, n-1, 1);
    diag_b = repmat(db, n-1, 1);
    
    % Set the correct length.
    diag_a = [0; diag_a];
    diag_b = [diag_b; 0];
    
    % Return the tridiagonal matrix.
    tridiag = spdiags ([diag_b diag diag_a], -1 : 1, n, n);
end