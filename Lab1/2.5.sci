n = -3:3;
x = [0, 0, 1, 3, -2, 0, 0];
x_folded = x($:-1:1);

x_e = 0.5 * (x + x_folded);
x_o = 0.5 * (x - x_folded);

// Đồ thị 1: Tín hiệu gốc
subplot(3, 1, 1);
plot2d3(n, x);
title("Original Signal x(n)");
xlabel("n"); ylabel("Amplitude");

// Đồ thị 2: Thành phần chẵn
subplot(3, 1, 2);
plot2d3(n, x_e);
title("Even Component x_e(n)");
xlabel("n"); ylabel("Amplitude");

// Đồ thị 3: Thành phần lẻ
subplot(3, 1, 3);
plot2d3(n, x_o);
title("Odd Component x_o(n)");
xlabel("n"); ylabel("Amplitude");
