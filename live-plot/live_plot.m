clc; clear;

%% Testing the function
time = 0:0.1:10;
wn = 1;
sig = 0.2;
out =  1 -exp(-wn*sig*time) * sin(wn*sqrt(1 - sig^2));
% plot(time, out);
index = 20;
s = tf('s');
sys = wn^2 / (s^2 + 2*sig*wn*s + wn^2);
[output, time] = step(sys);

sizeOut = length(output);
interval = time(2);
buffer = 0:interval:index*interval;

totalSize = length(buffer) + sizeOut;

stepOut = zeros(1, totalSize);
stepOut(index + 1:end) = 1;

totalTime = [buffer time' + buffer(end) + interval];

respOut = [zeros(1, index + 1) output'];

%live_plot = LivePlot();

%dataSet = [posData; velData; accData];
dataSet = [respOut; stepOut];

main(dataSet);

%% Live Plotting Function
function main(data)
    % Initializing our data matrices.
    time = [];
    parseData = [];
    %time = zeros(1, length(data));
    %parseData = zeros(length(data(:, 1)), length(data));
  
    % Starting writing for a video
    %video = VideoWriter('live-plot-showcase.avi', 'Uncompressed AVI');
    %open(video);

    for t = 1:length(data)

        % Putting the data into something we can plot.
        time = [time; t - 1];
        %time(t) = t;

        parseData = [parseData, data(:, t)];
        %parseData(:, t) = data(:, t);

        % returnMATLAB hates me without this
        plotData = parseData';
    
        % Creating our plot(s)
        %LivePlot().update_plot(plotData, time, length(data));
        LivePlot().update_plot(plotData, time, length(data));

        % Saving frames for video
        %frame = getframe(gcf);
        %writeVideo(video, frame);
        
        pause(0.02)
    end

    % Add another ~4seconds to the end of the video 
    %for i = 1:100
    %    writeVideo(video, frame);
    %end

    % End recording
    %close(video);

end
