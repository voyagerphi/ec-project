function [ax, ax2, senW] = draw_plot(winW,winH)
         % Initialize Map Area
        ax = axes('Units', 'pixels');
        ax.Position = [0.5*winW 0.05*winH 0.45*winW 0.45*winW];
        axis([0 22 0 22])
        axis off;
        
        % Initialize Sensor Area
        senW = 0.4 * winW;
        ax2 = axes('Units', 'pixels');
        ax2.Position = [0.05 * winW, 0.05 * winH, senW, senW];    
        axis off;        
end
