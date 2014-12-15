colormap(jet(1024));

for t = 1 : 100
    behavior_map = history{t}
    imagesc(behavior_map, [0, 1]);
    pause(0.1);
end


