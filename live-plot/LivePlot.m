classdef LivePlot
    %LIVEPLOT Summary of this class goes here
    %   Detailed explanation goes here
    properties 
    end
    
    methods
        function update_plot(self, data, time, datasize)
            %plot(x(isNZ),y(isNZ))   % plot only the subset
            figure(1)
            plot(time, data(:, 1), "Color", [0.5, 0.8, 0.5], "LineWidth", 3)
            hold on
            plot(time, data(:, 2), "Color", [0.8, 0, 0.5], "LineWidth", 3)
            grid on
            
            title("Step Response for Second Order Plot")
            xlabel("Time (s)")
            ylabel("Position (m)")
            legend("Step Response", "Step Function")

            xlim([0 datasize])
            ylim([0, 1.6])
            hold off
        end
        function update_plot_alternate(self, update)
        
        end
        function clear_plot(self)
        
        end
    end
end