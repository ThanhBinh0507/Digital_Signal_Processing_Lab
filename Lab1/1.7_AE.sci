F_max_17 = 10000;
disp("Dải tần số lấy mẫu an toàn (Hz): >= " + string(2 * F_max_17));

Fs_17 = 8000; // Tần số lấy mẫu 8 kHz
// Hàm tính tần số biểu kiến (alias)
function F_alias = calc_alias(F_in, F_s)
    k = round(F_in / F_s);
    F_alias = abs(F_in - k * F_s);
endfunction

F1_alias = calc_alias(5000, Fs_17);
F2_alias = calc_alias(9000, Fs_17);
disp("Tần số 5kHz khi lấy mẫu 8kHz sẽ xuất hiện thành: " + string(F1_alias) + " Hz");
disp("Tần số 9kHz khi lấy mẫu 8kHz sẽ xuất hiện thành: " + string(F2_alias) + " Hz");
