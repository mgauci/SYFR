clear
clc

size = 50;

x = 1 : size;
y = 1 : size;
[X, Y] = meshgrid(x, y);

mu = [10, 25];
Sigma = 125 * [1, 0; 0, 1];
F = mvnpdf([X(:), Y(:)], mu, Sigma);
F = reshape(F, length(y), length(x))';
F = F / max(max(F));

mu = [40, 25];
Sigma = 125 * [1, 0; 0, 1];
G = mvnpdf([X(:), Y(:)], mu, Sigma);
G = reshape(G, length(y), length(x))';
G = G / max(max(G));

H = max(F, G);

noise = 0.25;
H = (1 - noise) * H + noise * rand(size, size);


A = repmat(1 : size, size, 1)';
% A = A .* rand(size, size);
A = A / max(max(A));
A = 0.5 + 0.5*A;

init_behaviors = H;
init_attitudes = A;

Pop = Population(init_behaviors, init_attitudes);

history = {100};

for t = 1 : 100
    disp(t)
    history{t} = Pop.BehaviorMap();
    Pop.Update();
    pause(0.01);
end
