function h = pnnl_strip_plot(x,Y,plot_title,x_label,y_label,color,displayName)
    %pnnl_strip_plot Strip plot
    %
    %   pnnl_strip_plot(x,Y,plot_title,x_label,y_label) plots the rows of
    %   matrix Y in horizontal strips with x-axis x with plot_title as the
    %   title of the plot, x_label as the xlabel, and y_label as the
    %   y_label.
    %
    %   Example:
    %      
    %      load('pnnl_napalm_data');
    %      pnnl_strip_plot(Wavenumbers,A_train,'Absorbance spectra of training data','wavenumber (cm^{-1})','A_{train}');

    % Copyright 2022-2023 Battelle Memorial Institute
    if nargin < 6
        color = pnnl_colorOrder(1);
        color = color(1,:);
    end
    if nargin < 7
        displayName = '';
    end
    m = size(Y,1);
    offset = 0.5;
    for i = m:-1:1
        h(i) = line(x,Y(i,:) + (m-i+1)*offset,'LineWidth',2,'Color',color,'DisplayName',displayName);
    end
    xlabel(x_label,'Interpreter','tex');
    ylabel(y_label,'Interpreter','tex');
    ytick = offset*(1:m);
    yticklabel = m:-1:1;
    ax = gca;
    ax.FontSize = 14;
    ax.YTick = ytick;
    ax.YTickLabel = yticklabel;
    box on
    axis tight
    title(plot_title)
end
% Reference
%
% A Practical Guide to Chemometric Analysis of Optical Spectroscopic Data
%   Hope E. Lackey,1,2 Rachel L. Sell,1 Gilbert L. Nelson,3* 
%   Thomas A. Bryan,4* Amanda M. Lines,1,2* Samuel A. Bryan1,2* 
%
% 1 Pacific Northwest National Laboratory, 902 Battelle Boulevard,
%   Richland, WA 99352 
% 2 Washington State University, Department of Chemistry, Pullman
%   WA 99164 
% 3 College of Idaho, Department of Chemistry, 2112 Cleveland Blvd,
%   Caldwell, ID 83605 
% 4 The MathWorks, 3 Apple Hill Drive, Natick, MA 01760-2098
% 
% *Email: sam.bryan@pnnl.gov Phone 1 509 375 5648;
%         orcid.org/0000-0002-8826-0880 
% *Email: tbryan@mathworks.com Phone 1 508 647 7669
% *Email: amanda.lines@pnnl.gov Phone: 1 509 375 5689
% *Email: gnelson@collegeofidaho.edu Phone: 1 208 459 5241
%
% Disclaimer
%
% This material was prepared as an account of work sponsored by an agency
% of the United States Government.  Neither the United States Government
% nor the United States Department of Energy, nor Battelle, nor any of
% their employees, nor any jurisdiction or organization that has cooperated
% in the development of these materials, makes any warranty, express or
% implied, or assumes any legal liability or responsibility for the
% accuracy, completeness, or usefulness or any information, apparatus,
% product, software, or process disclosed, or represents that its use would
% not infringe privately owned rights.
% 
% Reference herein to any specific commercial product, process, or service
% by trade name, trademark, manufacturer, or otherwise does not necessarily
% constitute or imply its endorsement, recommendation, or favoring by the
% United States Government or any agency thereof, or Battelle Memorial
% Institute. The views and opinions of authors expressed herein do not
% necessarily state or reflect those of the United States Government or any
% agency thereof.
% 
%                  PACIFIC NORTHWEST NATIONAL LABORATORY
%                               operated by
%                                 BATTELLE
%                                 for the
%                    UNITED STATES DEPARTMENT OF ENERGY
%                     under Contract DE-AC05-76RL01830