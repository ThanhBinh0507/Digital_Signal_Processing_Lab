// ===== Exercise 4 : vi du xu ly am thanh =====
clc; clear;
Fs = 8000; // tan so lay mau
t = (0:Fs-1) / Fs;  // 1 giay
x = 0.5* sin (2* %pi *440*t) + 0.3* sin (2* %pi *2000*t);

fname = TMPDIR + "/ two_tones .wav";
wavwrite (x, Fs , fname); // ghi file wav
[y, Fs2 , bits] = wavread (fname); // doc lai
y = y(1, :); // lay kenh 1
mprintf ("Fs = %d Hz , %d bit , %d mau\n", Fs2 , bits , length (y));

// pho bien do
N = length (y);
Y = abs(fft(y)) / N;
f = (0:N -1) * Fs2 / N;
half = 1: floor(N/2);

// loc thong thap FIR , cat 1000 Hz (tan so chuan hoa 1000/ Fs)
hlp = wfir("lp", 101, [1000/ Fs2 0], "hm", [0 0]);
yf = filter (hlp , 1, y);
Yf = abs(fft(yf)) / N;

scf (0); clf ();
subplot (3 ,1 ,1); plot(t (1:400) , y (1:400) );
xtitle ("Tin hieu goc (50 ms dau)", "t (s)", "Bien do");
subplot (3 ,1 ,2); plot(f(half), Y(half));
xtitle ("Pho tin hieu goc", "f (Hz)", "|Y(f)|");
subplot (3 ,1 ,3); plot(f(half), Yf(half));
xtitle ("Pho sau loc thong thap 1000 Hz", "f (Hz)", "|Yf(f)|");

// playsnd(y, Fs2);  playsnd(yf, Fs2);     // nghe truoc / sau khi loc
wavwrite(yf, Fs2, TMPDIR + "/filtered.wav");
