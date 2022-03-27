load testImage.mat

figure
imagesc(testImage)
colormap gray
axis tight square off
title('Original')

lowpass = ones(5);
lowpass(:) = 1/25;

Mfilt_lowpass = kernelFilter(testImage,lowpass);

figure
imagesc(Mfilt_lowpass)
colormap gray
axis tight square off
title('Low Pass')

outline = ones(3);
outline(:) = -1;
outline(2,2) = 8;

Mfilt_outline = kernelFilter(Mfilt_lowpass,outline);

figure
imagesc(Mfilt_outline)
colormap gray
axis tight square off
title('Low Pass + Outline')