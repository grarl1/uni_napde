% Values for epsilon and mesh-sizes
epsilon = 0.1;
h = [1/10 1/20 1/40 1/80];
B = zeros(1, length(h));

% Calculation of bounds
for i = 1 : length(h)
  % Approximation
  u_h = fem(h(i), epsilon);
  % Bound
  B(i) = post_bound(u_h, h(i), epsilon);
end
% N as x axis
f = figure;
hold all
loglog(1./h, B)
loglog(1./h, [0.0151 0.0039 9.7229e-4 2.4342e-4]);
title('Posteriori error analysis')
xlabel('N')
ylabel('Global error')
legend('Error bound','Real error')
saveas(f, '../img/post_N.png')

% h slope
poly = polyfit(log(h), log(B) , 1);
slope = poly(1)

% h as x axis
h = [1/10 1/20 1/40 1/80 1/100 1/200];
B = zeros(1, length(h));
% Calculation of bounds
for i = 1 : length(h)
  % Approximation
  u_h = fem(h(i), epsilon);
  % Bound
  B(i) = post_bound(u_h, h(i), epsilon);
end
f = figure;
loglog(h, B)
title('Posteriori error analysis')
xlabel('h')
ylabel('Global error')
legend('Error bound')
saveas(f, '../img/post_h.png')


