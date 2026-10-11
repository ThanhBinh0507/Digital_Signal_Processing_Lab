function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // Xác định trục thời gian n của x1(n) và x2(n) dựa vào vị trí gốc tọa độ
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // Tìm giới hạn thời gian chung cho cả hai tín hiệu
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    n = n_min:n_max;
    
    // Tạo các mảng đệm chứa giá trị 0 có cùng kích thước với trục thời gian chung
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    
    // Gán các giá trị của x1n và x2n vào đúng vị trí trên mảng đệm
    y1(n1 - n_min + 1) = x1n;
    y2(n2 - n_min + 1) = x2n;
    
    // Thực hiện phép nhân từng phần tử (element-wise multiplication)
    yn = y1 .* y2;
    
    // Xác định vị trí gốc tọa độ của y(n)
    yorigin = 1 - n_min;
    
    figure;
    
    // Vẽ đồ thị tín hiệu x1(n)
    subplot(3, 1, 1);
    plot2d3('gnn', n1, x1n);
    plot(n1, x1n, 'ro');
    xtitle('Tin hieu x1(n)', 'n', 'x1(n)');
    
    // Vẽ đồ thị tín hiệu x2(n)
    subplot(3, 1, 2);
    plot2d3('gnn', n2, x2n);
    plot(n2, x2n, 'ro');
    xtitle('Tin hieu x2(n)', 'n', 'x2(n)');
    
    // Vẽ đồ thị tín hiệu ngõ ra y(n)
    subplot(3, 1, 3);
    plot2d3('gnn', n, yn);
    plot(n, yn, 'ro');
    xtitle('Tin hieu y(n) = x1(n) * x2(n)', 'n', 'y(n)');
endfunction
// Khai báo tín hiệu x1(n)
x1n = [0, 1, 3, -2];
x1origin = 1;

// Khai báo tín hiệu x2(n)
x2n = [1, 1, 2, 3];
x2origin = 2;

// Gọi hàm multi để thực hiện phép nhân
[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);

// In kết quả
disp("Vector tin hieu ngo ra yn la: ");
disp(yn);

disp("Vi tri goc yorigin cua y(n) la: ");
disp(yorigin);
