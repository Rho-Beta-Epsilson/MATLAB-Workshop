function subplotderiv(posData, graphData, legend)
% posData is a (M+1)xN set of data where M is the amount of curves to plot
% and the first row is the x axis data. The derivative of each row would be
% calculated and plotted on the same graph. 
% graphData is a (K)x3 set of data where K represents the number of 
% derivatives to calculate. Each column is formatted as:
% <title> <x axis label> <y axis label>
% These three strings are the title, x axis label, and y axis label for
% each chart
% Legend is an array of size Mx1 that has the names of each y axis that is
% plotted in the same order as they are added to posData
close all
n = height(graphData); % Number of derivatives - 1
nleg = height(legend);
inpgraphData = [graphData(1, :); legend strings(nleg, 2)];
subplot(n, 1, 1);
plotpos(posData, inpgraphData);
derivData = posData;
for iter = 2:n
    inpgraphData = [graphData(iter, :); legend strings(nleg , 2)];
    subplot(n, 1, iter);
    derivData = plotderiv(derivData, inpgraphData);  
end

% Need graph title per graph; x axis; y axis
% Need name once for each input 
% 
% graphsub = ["Zero Order Response" "Time (s)" "Position (m)";
%             "First Order Response" "Time (s)" "Speed (m/s)";
%             "Second Order Response" "Time(s)" "Acceleration (m^2 / s)"];
% legend = ["Step Function"; "Step Response"];
end