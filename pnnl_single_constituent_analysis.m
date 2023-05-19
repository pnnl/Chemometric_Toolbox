function [C_predicted,RMSEP,C_predicted_train,RMSEC,C_cross_validation,RMSECV] = pnnl_single_constituent_analysis(method,A_train,C_train,A_unknown,C_validation,nComponents,varargin)
    %pnnl_single_constituent_analysis Single constituent analysis

    % Copyright 2022-2023 Battelle Memorial Institute
    [p_train,n_train] = size(C_train);
    [p_unknown,n] = size(C_validation);
    assert(isequal(n_train,n),'The training and validation sets must have the same number of constituents.');

    nSamples = length(nComponents);
    C_predicted = zeros(p_unknown, n, nSamples);
    C_predicted_train = zeros(p_train, n, nSamples);
    C_cross_validation = zeros(p_train, n, nSamples);
    for j = 1:n
        for i = 1:nSamples
            r = nComponents(i);
            C_predicted(:,j,i) = method(A_train,C_train(:,j),A_unknown,r,varargin{:});
            C_predicted_train(:,j,i) = method(A_train,C_train(:,j),A_train,r,varargin{:});
            C_cross_validation(:,j,i) = pnnl_cross_validation(method,A_train,C_train(:,j),r,varargin{:});
        end
    end
    RMSEP  = zeros(nSamples,n);
    RMSEC  = zeros(nSamples,n);
    RMSECV = zeros(nSamples,n);
    for i = 1:nSamples
        RMSEP(i,:)  = pnnl_rmse(C_predicted(:,:,i), C_validation);
        RMSEC(i,:)  = pnnl_rmse(C_predicted_train(:,:,i), C_train);
        RMSECV(i,:) = pnnl_rmse(C_cross_validation(:,:,i), C_train);
    end
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