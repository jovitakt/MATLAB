% Problem 2

speed = [0.2, 0.3, 0.7, 1.3, 1.9, 255.0, 1.6, 8.5, 1.4, 255.0, 0.9, 0.7, 255.0, 20.7, 0.6];
time = [0:100:1400];

% Question A
less_than_0pt5 = nnz(speed<0.5);

% Question B
corresponding_time = time(speed<0.5);

% Question C
speeds_between_350_and_1050 = speed(350<time & time<1050);

% Question D
speed(speed==255) = NaN;
plot(time,speed,'-o')
ylabel("Speed (m/s)")
xlabel("Time (s)")