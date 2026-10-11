function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Thực hiện tính tích chập 2 vector tín hiệu
    yn = convol(xn, hn);
    
    // Tính toán vị trí của điểm gốc (n=0) cho tín hiệu y(n)
    yorigin = xorigin + horigin - 1;
    
    // -- PHẦN VẼ ĐỒ THỊ (Tùy chọn hiển thị) --
    // Tạo trục thời gian n cho từng tín hiệu dựa trên vị trí origin
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    figure;
    
    // Vẽ đồ thị tín hiệu ngõ vào x(n)
    subplot(3, 1, 1);
    plot2d3('gnn', nx, xn);
    plot(nx, xn, 'ro'); // Đánh dấu điểm
    xtitle('Tin hieu ngo vao x(n)', 'n', 'x(n)');
    
    // Vẽ đồ thị hàm đặc trưng hệ thống h(n)
    subplot(3, 1, 2);
    plot2d3('gnn', nh, hn);
    plot(nh, hn, 'ro');
    xtitle('Dap ung xung h(n)', 'n', 'h(n)');
    
    // Vẽ đồ thị tín hiệu ngõ ra y(n)
    subplot(3, 1, 3);
    plot2d3('gnn', ny, yn);
    plot(ny, yn, 'ro');
    xtitle('Tin hieu ngo ra y(n) = x(n)*h(n)', 'n', 'y(n)');
endfunction
// 1. Khai báo tín hiệu x(n) = {1, 2, 3↑, 4}
// Gốc tọa độ nằm ở phần tử có giá trị 3 (vị trí thứ 3 trong mảng)
xn = [1, 2, 3, 4];
xorigin = 3;

// 2. Khai báo tín hiệu h(n) = {1↑, 1, 1}
// Gốc tọa độ nằm ở phần tử có giá trị đầu tiên (vị trí thứ 1 trong mảng)
hn = [1, 1, 1];
horigin = 1;

// 3. Gọi hàm convolution vừa tạo
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

// 4. In kết quả ra màn hình (Console)
disp("Vector tin hieu ngo ra yn la: ");
disp(yn);

disp("Vi tri goc yorigin cua y(n) la: ");
disp(yorigin);
