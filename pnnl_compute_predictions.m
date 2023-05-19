function [C_predicted_array, RMSEP, C_predicted_train_array, RMSEC, C_cross_validation_array, RMSECV,label_array] = ...
        pnnl_compute_predictions(method,label_format,A_train,C_train,A_unknown,C_validation,varargin)
    %pnnl_compute_predictions Compute predictions

    % Copyright 2022-2023 Battelle Memorial Institute
    if isempty(varargin)
        nConstituents = 1;
    else
        nConstituents = varargin{1};
    end
    [p_train,n_train] = size(C_train);
    [p_unknown,n] = size(C_validation);
    assert(isequal(n_train,n),'The training and validation sets must have the same number of constituents');

    C_predicted_array = zeros(p_unknown,n,length(nConstituents));
    C_predicted_train_array = zeros(p_train,n,length(nConstituents));
    C_cross_validation_array = zeros(p_train,n,length(nConstituents));
    RMSEP = zeros(length(nConstituents),n);
    RMSEC = zeros(length(nConstituents),n);
    RMSECV = zeros(length(nConstituents),n);
    label_array = cell(length(nConstituents),1);
    for k = 1:length(nConstituents)
        r = nConstituents(k);
        label_array{k} = sprintf(label_format,r);
        C_predicted = method(A_train,C_train,A_unknown,r,varargin{2:end});
        C_predicted_array(:,:,k) = C_predicted;
        C_predicted_train = method(A_train,C_train,A_train,r,varargin{2:end});
        C_predicted_train_array(:,:,k) = C_predicted_train;
        C_cross_validation = pnnl_cross_validation(method,A_train,C_train,r,varargin{2:end});
        C_cross_validation_array(:,:,k) = C_cross_validation;
        RMSEP(k,:) = pnnl_rmse(C_validation,C_predicted);
        RMSEC(k,:) = pnnl_rmse(C_train,C_predicted_train);
        RMSECV(k,:) = pnnl_rmse(C_train,C_cross_validation);

    end
    C_predicted_array = squeeze(C_predicted_array);
    C_predicted_train_array = squeeze(C_predicted_train_array);
    C_cross_validation_array = squeeze(C_cross_validation_array);
    RMSEP = squeeze(RMSEP);
    RMSEC = squeeze(RMSEC);
    RMSECV = squeeze(RMSECV);
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