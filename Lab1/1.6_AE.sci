Tp = 1; // Giả sử chu kỳ tín hiệu liên tục là 1s
F0 = 1/Tp;

// Trường hợp 1: T/Tp là số hữu tỉ (Ví dụ T = 0.1s => T/Tp = 1/10)
T_rational = 0.1; 
n1 = 0:40; // Lấy 40 mẫu
x_rational = cos(2 * %pi * F0 * n1 * T_rational);

subplot(2,1,1);
plot2d3(n1, x_rational); plot(n1, x_rational, 'ro');
title("1.6: T/Tp = 1/10 (Hữu tỉ) -> Dãy x(n) tuần hoàn (Chu kỳ N=10)");
xgrid();

// Trường hợp 2: T/Tp là số vô tỉ (Ví dụ T = 1/pi => T/Tp = 1/pi)
T_irrational = 1/%pi;
n2 = 0:40;
x_irrational = cos(2 * %pi * F0 * n2 * T_irrational);

subplot(2,1,2);
plot2d3(n2, x_irrational); plot(n2, x_irrational, 'ro');
title("1.6: T/Tp = 1/\pi (Vô tỉ) -> Dãy x(n) không tuần hoàn");
xgrid();
