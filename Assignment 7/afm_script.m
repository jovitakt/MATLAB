figure % create a new figure window
image(AFM_tip_1) % plot AFM probe tip image
colormap(gray(1024)) % specify gray colormap with 1024 discriminations
cb = colorbar; % add a color bar with label
ylabel(cb,'Pixel value')
hold on
[x,y] = edgeDetect(AFM_tip_1,500);
plot(y,x,'y.') % overlay edge indices in yellow
hold off