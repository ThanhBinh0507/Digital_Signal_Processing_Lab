function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Xác định trục thời gian thực của x1(n) và x2(n) dựa vào vị trí gốc
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // Xác định giới hạn trục thời gian cho tín hiệu ngõ ra y(n)
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    n = n_min:n_max;
    
    // Khởi tạo mảng yn với các giá trị 0 có chiều dài bằng trục thời gian n
    yn = zeros(1, length(n));
    
    // Cộng x1(n) vào yn tại các vị trí tương ứng
    // Vị trí chỉ số index trong Scilab bắt đầu từ 1, do đó ta dịch mốc n_min về 1
    yn(n1 - n_min + 1) = yn(n1 - n_min + 1) + x1n;
    
    // Cộng tiếp x2(n) vào yn
    yn(n2 - n_min + 1) = yn(n2 - n_min + 1) + x2n;
    
    // Xác định vị trí gốc tọa độ của y(n) (nơi n = 0)
    yorigin = 1 - n_min;
    
    figure;
    
    subplot(3, 1, 1);
    plot2d3('gnn', n1, x1n);
    plot(n1, x1n, 'ro');
    xtitle('Tin hieu x1(n)', 'n', 'x1(n)');
    
    subplot(3, 1, 2);
    plot2d3('gnn', n2, x2n);
    plot(n2, x2n, 'ro');
    xtitle('Tin hieu x2(n)', 'n', 'x2(n)');
    
    subplot(3, 1, 3);
    plot2d3('gnn', n, yn);
    plot(n, yn, 'ro');
    xtitle('Tin hieu y(n) = x1(n) + x2(n)', 'n', 'y(n)');
endfunction
// Khai báo tín hiệu x1(n)
x1n = [0, 1, 3, -2];
x1origin = 1;

// Khai báo tín hiệu x2(n)
x2n = [1, 1, 2, 3];
x2origin = 2;

// Gọi hàm add
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);

// In kết quả
disp("Vector tin hieu ngo ra yn la: ");
disp(yn);

disp("Vi tri goc yorigin cua y(n) la: ");
disp(yorigin);
