function pnnl_plot_concentration(label,ConstituentNames,C_train,C_validation,C_predicted,C_predicted_train,C_predicted_cross_validation)
    %pnnl_plot_concentration Plot concentrations

    % Copyright 2022-2023 Battelle Memorial Institute

    % Concentrations
    data = load('pnnl_napalm_data','-mat','ConcentrationUnits');
    figure;
    font_size = 14;
    plot(C_validation,C_predicted,'.','MarkerSize',35);
    % Let the default parula color order be used, ...
    ax = gca;
    colorOrder = ax.ColorOrder;
    hold on
    plot(C_train,C_predicted_train,'o','MarkerSize',10,'LineWidth',1)
    plot(C_train,C_predicted_cross_validation,'+','MarkerSize',10,'LineWidth',1)
    % ... then reset the color order to recycle the first n colors so the
    % constituent are always the same color.
    n = size(C_validation,2);
    ax.ColorOrder = colorOrder(1:n,:);
    line(C_train,C_train,'Color','k')
    legend(ConstituentNames{:},...
        'Location','northwest',...
        'FontSize',font_size);
    axis square
    grid on
    title(['Concentrations (',label,')'])
    xlabel(['Known constituent (',data.ConcentrationUnits,')'])
    ylabel(['Predicted constituent (',data.ConcentrationUnits,')'])
    ax.FontSize = font_size;
    box on
    hold off
    pnnl_addbars;
    disp('Legend: Dot is predicted. Circle is calibration. Cross is cross-validation.')
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