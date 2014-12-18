clear
clc

size = 100;

x = 1 : size;
y = 1 : size;
[X, Y] = meshgrid(x, y);

mu = [25, 25];
Sigma = 250 * [1, 0; 0, 1];
F = mvnpdf([X(:), Y(:)], mu, Sigma);
F = reshape(F, length(y), length(x))';
F = F / max(max(F));

mu = [75, 75];
Sigma = 250 * [1, 0; 0, 1];
G = mvnpdf([X(:), Y(:)], mu, Sigma);
G = reshape(G, length(y), length(x))';
G = G / max(max(G));

H = max(F, G);

noise = 0.25;
H = (1 - noise) * H + noise * rand(size, size);

% A = rand(size, size);
% A(1 : floor(size / 2) - 1, : ) = 0.5*A(1 : floor(size / 2) - 1, :);
% A(floor(size / 2) : size, :) = 0.5 + (0.5 * A(floor(size / 2): size, :));

A = repmat(1 : size, size, 1)';
A = A / max(max(A));
A = 0.5 + 0.5*A;

init_behaviors = H;
init_attitudes = A;

Pop = Population(init_behaviors, init_attitudes);

T = 1000;

history = zeros(size, size, T);

for t = 1 : T
    disp(t)
    history(:, :, t) = Pop.BehaviorMap();
    Pop.Update();
end
