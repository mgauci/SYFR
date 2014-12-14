clear
clc

Pop = Population(10);

colormap(jet(1024))

for t = 1 : 1000
    imagesc(Pop.BehaviorMap, [0, 1]);
    Pop.Step();
    pause(0.01);
end

