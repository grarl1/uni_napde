function [x, U, t] = thetamet(theta, J, T, nu, mu)

    tic;

    if nu > 0
        N = round(T*J*J/nu);
    elseif mu > 0
        N = round(T*J/mu);
        nu = mu*J;
    end

    t = toc;

end
