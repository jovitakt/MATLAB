load AFM_tip_1.mat
figure % create a new figure window

image(AFM_tip_1) % plot AFM probe tip image
colormap(gray(1024)) % specify gray colormap with 1024 discriminations
cb = colorbar; % add a color bar with label
ylabel(cb,'Pixel value')

hold on % Hold on to overlay the next plot
[x,y] = edgeDetect(AFM_tip_1,500); % Call function to determine edge indices
plot(y,x,'y.') % overlay edge indices in yellow
hold off % Stop holding

load AFM_tip_2.mat
figure % create a new figure window

image(AFM_tip_2) % plot AFM probe tip image
colormap(gray(1024)) % specify gray colormap with 1024 discriminations
cb = colorbar; % add a color bar with label
ylabel(cb,'Pixel value')

hold on % Hold on to overlay the next plot
[x,y] = edgeDetect(AFM_tip_2,350); % Call function to determine edge indices
plot(y,x,'y.') % overlay edge indices in yellow
hold off % Stop holding