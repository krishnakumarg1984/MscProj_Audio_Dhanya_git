% script1.m
% Demonstrates the generation of synthetic tones

clear; close all;clc;format short g;
set(0,'defaultLineLineWidth',2);
t_end = 10;                     % Max duration
Fs = 16000; Ts = 1/Fs;          % Sampling frequency, sampling period
time = 0:Ts:t_end;              % Define when sampling occurs
Freqs = [250 550 900];          % These are the frequencies of the signals
Xs = zeros(length(Freqs), length(time));

for i=1:length(Freqs)           % Create one audio signal (tone) per frequency
    Xs(i,:) = cos(2*pi*Freqs(i)*time);
end

x = sum(Xs);                    % The final sum of tones
x = x ./ max(abs(x));           % Normalize x


if t_end <= 0.1
    figure(1);clf;
    h1 = subplot(211);
    plot(time,Xs(1,:)); hold on;
    plot(time,Xs(2,:));
    plot(time,Xs(3,:));
    
    h2 = subplot(212);
    plot(time,x);
    linkaxes([h1 h2],'xy');
    xlim([0 0.01]);
    ylim([-1.5 1.5]);
    xlabel('Time (sec)'); ylabel('Signal Ampl.');
    title('A simple audio signal')
else
    sound(x,Fs);
end