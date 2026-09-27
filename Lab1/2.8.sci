nx = [-2, -1, 0, 1];
x  = [1, -2, 3, 6];
ny1 = -nx; 
y1 = x;

// Mở cửa sổ 1
scf(1);
subplot(2, 1, 1);
plot2d3(nx, x);
a = gca();
a.data_bounds = [-3, -3; 2, 7];
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(ny1, y1);
b = gca();
b.data_bounds = [-2, -3; 3, 7];
title("y_1(n) = x(-n)"); xlabel("n"); ylabel("Amplitude");

ny2 = nx - 3;
y2 = x;

// Mở cửa sổ 2
scf(2);
subplot(2, 1, 1);
plot2d3(nx, x);
a2 = gca(); 
a2.data_bounds = [-3, -3; 2, 7];
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(ny2, y2);
b2 = gca();
b2.data_bounds = [-6, -3; -1, 7];
title("y_2(n) = x(n+3)"); xlabel("n"); ylabel("Amplitude");

ny3 = -nx - 2;
y3 = 2 * x;

// Mở cửa sổ 3
scf(3);
subplot(2, 1, 1);
plot2d3(nx, x);
a3 = gca(); 
a3.data_bounds = [-3, -3; 2, 7];
title("Original Signal x(n)"); xlabel("n"); ylabel("Amplitude");

subplot(2, 1, 2);
plot2d3(ny3, y3);
b3 = gca();
b3.data_bounds = [-4, -5; 1, 13];
title("y_3(n) = 2x(-n-2)"); xlabel("n"); ylabel("Amplitude");
