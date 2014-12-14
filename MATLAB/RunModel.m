clear
clc

x1 = 1:100;
x2 = 1:100;
[X1, X2] = meshgrid(x1, x2);
mu = [75, 10];
Sigma = 100 * [1, 0.5; 0.5, 1];
F = mvnpdf([X1(:), X2(:)], mu, Sigma);
F = reshape(F, 100, 100);

F = F';
F = F / F(75, 10);
F = F';

colormap(jet(1024));
imagesc(flip(F, 1), [0, 1]);


% Pop = Population(100);
% 
% colormap(jet(1024))
% 
% for t = 1 : 10000
%     imagesc(Pop.BehaviorMap(), [0, 1]);
%     disp(t)
%     Pop.Update();
%     pause(0.01);
% end

