function [yn, yorigin] = fold(xn, xorigin)
  // Đảo ngược mảng tín hiệu đầu vào
   yn = xn($:-1:1);

  // Xác định vị trí gốc tọa độ mới
   yorigin = length(xn) - xorigin + 1;

  // Tạo trục thời gian n dựa trên vị trí origin
  nx = (1:length(xn)) - xorigin;
  ny = (1:length(yn)) - yorigin;

   figure;

  // Vẽ đồ thị tín hiệu ngõ vào x(n)
   subplot(2, 1, 1);
   plot2d3('gnn', nx, xn);
   plot(nx, xn, 'ro');
  xtitle('Tin hieu goc x(n)', 'n', 'x(n)');

   // Vẽ đồ thị tín hiệu sau khi fold y(n)
   subplot(2, 1, 2);
   plot2d3('gnn', ny, yn);
   plot(ny, yn, 'ro');
   xtitle('Tin hieu y(n) = x(-n)', 'n', 'y(n)');
endfunction
xn = [1, -2, 3, 6];
xorigin = 3;

[yn, yorigin] = fold(xn, xorigin);

disp("Vector tin hieu ngo ra yn la: ");
disp(yn);

disp("Vi tri goc yorigin cua y(n) la: ");
disp(yorigin);
