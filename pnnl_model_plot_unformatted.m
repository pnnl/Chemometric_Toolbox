function pnnl_model_plot_unformatted(modtype, comptype, Wavenumbers,...
        ConstituentNames, Wavenumberlabel, ConcentrationUnits, M_comps, ...
        C_train, C_predicted_train, C_validation, C_predicted)
    %pnnl_model_plot_unformatted Display model constituents
    %   pnnl_model_plot_unformatted can be used to display model
    %   constituents or regression factors from multivariate models, as
    %   well as displaying the relationship between known values and values
    %   predicted by multivariate models for numerous constituents which
    %   contribute to optical spectral signatures used to build the model.
    %
    %   These plots are not formatted for publications. Users of this
    %   function are encouraged to use these plots as a starting point and
    %   develop their MATLAB skills to produce publication-ready plots.

    % Copyright 2022-2023 Battelle Memorial Institute
    if nargin >= 11
        validationDataPresent = true;
    else
        validationDataPresent = false;
    end
    if size(Wavenumbers,2)~=size(M_comps,2)
        M_comps=M_comps';
    end 
    r=size(M_comps,1); 
    leggy="";
    for i=1:r
        leggy(i)=sprintf("%s %d",comptype,i); 
    end 
    n=size(C_train,2);
    subplot(2,n,1:n)
    hold on
    plot(Wavenumbers,M_comps, 'linewidth',1) 
    legend(leggy)
    xlabel(Wavenumberlabel)
    axis tight
    hold off
    for i=1:n
        subplot(2,n,n+i)
        hold on
        plot(C_train(:,i),C_train(:,i),'Color','r','linewidth',1)
        scatter(C_train(:,i),C_predicted_train(:,i),'MarkerFaceColor',[0.5 0.5 0.5],'MarkerEdgeColor','k')
            if validationDataPresent
                scatter(C_validation(:,i),C_predicted(:,i),'s','MarkerFaceColor','c','MarkerEdgeColor','b')
                legend({'1:1 fit','Training set','Validation set'},'Location','northeast')
            else
                legend({'1:1 fit','Training set'},'Location','southeast')
            end
            xlabel(sprintf('Known %s (%s)',ConstituentNames{i},ConcentrationUnits))
            ylabel(sprintf('Predicted %s (%s)',ConstituentNames{i},ConcentrationUnits))
        hold off 
    end 
    sgtitle(strcat(modtype, ' model results'))
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