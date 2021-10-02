ecg = load('ECG6.dat');
figure(1);
plot(ecg);

figure(2);
plot(ecg);
axis([3000 3800 1500 3300]);  % x axis range and y axis range

peaks_1 = ecg > 2500; % returns 1 or 0 depending on the y axis values in ecg
figure(3);
plot(1:numel(ecg), ecg, 'b', 1:numel(ecg), 2500*(ecg>2500), 'ro'); % numel returns the number of elements in ecg
% all y axis values over 2500 are marked and circled
axis([3000 3800 1500 3300]);

time = (1:numel(ecg))/200; % as there are 200 samples per second
figure(4)
[peaks_2, pos_peaks] = findpeaks(ecg); % finds all peaks in ecg 
plot(time, ecg, 'b', pos_peaks/200, (peaks_2), 'ro')
axis([15 19 1500 3300]);

figure(5)
[peaks_2, pos_peaks] = findpeaks(ecg, 'MINPEAKHEIGHT', 2400); % finds all peaks in ecg 
plot(time, ecg, 'b', pos_peaks/200, (peaks_2), 'ro')
axis([15 19 1500 3300]);

% For 120 BPM, time = 60/120 = 0.5 seconds for each heart beat
figure(6)
[peaks_2, pos_peaks] = findpeaks(ecg, 'MINPEAKDISTANCE', 100, 'MINPEAKHEIGHT', 2400); % minimum peak distance = 100 samples = 0.5 seconds 
plot(time, ecg, 'b', pos_peaks/200, (peaks_2), 'ro')
axis([15 19 1500 3300]);

figure(7)
subplot(211)
plot(time, ecg, 'b', pos_peaks/200, (peaks_2), 'ro')
grid on
axis tight
ylabel('ECG', 'fontsize', 16)

subplot(212)
plot(time(pos_peaks(2:end)),60/(diff(pos_peaks/200))); 
axis tight
x = 60/diff(pos_peaks/200); % diff returns an arry of differences between consecutive elements of pos_peaks/200
grid on
axis tight
ylabel('Heart Rate', 'fontsize', 16)
xlabel('Time (seconds)', 'fontsize', 16)
BPM = max(x)




