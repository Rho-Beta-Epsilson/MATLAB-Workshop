function plotpos(posData, graphData)
% Plot position with (M+1)xN set of data with all proper graph 
% characteristics and without leading and trailing whitespace. 
% posData has the first row is the x axis or time
% and the subsequent rows are the position data. With these variables, M
% represents the amount of data to be illustrated. N represents the size of the
% data and is an arbitrary value. Any size of data should be plotted with
% this function. 
% graphData is a (M+1)x3 set of data. Each column is formatted as:
% <title> <x axis label> <y axis label>
% Since there is only one plot, the first row will be the global name and
% global axis. The other labels will be ignored.

for iter = 2:height(posData)
    plot(posData(1, :), posData(iter, :));
    hold on;
    grid on;
end
title(graphData(1, 1));
xlabel(graphData(1, 2));
ylabel(graphData(1, 3));
legend(graphData(2:end, 1));
xlim([posData(1, 1) posData(1, end)]);
% Need axis labels (2); Need title (1); Need independent names

end

% graph = ["Step Response for Second Order Plot" "Time (s)" "Position (m)"; "Step Function" "" ""; "Step Response" "" ""];