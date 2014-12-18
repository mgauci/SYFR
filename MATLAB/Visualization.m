colormap(jet(1024));

for t = 1 : 500
    behavior_map = history(:, :, t);
    imagesc(behavior_map, [0, 1]);
    axis off;
    pause(0.1);
end


