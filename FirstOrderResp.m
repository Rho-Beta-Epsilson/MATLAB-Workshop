close all
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

plot(totalTime, stepOut);
hold on
plot(totalTime, respOut);

figure


% New approach

sizeInp = length(output);

stepResp = ones(1, sizeInp);

formOut = [stepResp; output'];

translateOut = zeros(2, index);

compOut = [translateOut formOut];

transTime = [0:interval:(index - 1)*interval time' + interval*index];


plot(transTime, compOut(1, :));
hold on
plot(transTime, compOut(2, :));

figure

OUTPUT = [transTime ; compOut];









% % for kp = 0.1:0.1:0.8
% for inc = 2:xLen
%     outStep(inc) = stepFunct(inc) + kp*outStep(inc - 1);
% end
% outStep  = outStep * 1/(outStep(end));
% plot(stepFunct);
% hold on
% plot(outStep);
% % figure
% % end