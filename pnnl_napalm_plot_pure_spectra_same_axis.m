function pnnl_napalm_plot_pure_spectra_same_axis
    %pnnl_napalm_plot_pure_spectra_same_axis Plot pure spectra on same axis

    % Copyright 2022-2023 Battelle Memorial Institute
    data = load('pnnl_napalm_data');
    ConstituentNames = data.ConstituentNames;
    Wavenumbers = data.Wavenumbers;
    WavenumberLabel = data.WavenumberLabel;

    % Pure spectra
    pure_spectra = pnnl_napalm_pure_spectra;

    figure
    % Get first three default colors and clear the figure
    plot(1,1,2,2,3,3);
    colorOrder = get(gca,'ColorOrder');
    clf

    plot(Wavenumbers,pure_spectra(1,:),'LineWidth',2,'Color',colorOrder(1,:))
    hold on
    title('Absorbance Spectra of Pure Compounds')
 
    plot(Wavenumbers,pure_spectra(2,:),'LineWidth',2,'Color',colorOrder(2,:))

    plot(Wavenumbers,pure_spectra(3,:),'LineWidth',2,'Color',colorOrder(3,:))
    
    legend(ConstituentNames)
    xlabel(WavenumberLabel,'Interpreter','tex');
    ylabel('Absorbance')
    h = gca;
    set(h,'FontSize',14);
    set(h,'YLim',[-0.02 2.25]);
    set(h,'XLim',[700 4000]);
    hold off
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