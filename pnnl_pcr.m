function [C_pcr, B_pcr] = pnnl_pcr(A_train, C_train, A_unknown, r, meanCentered)
    %pnnl_pcr Principal component regression (PCR)
    %
    %   [C_pcr, B_pcr] = pnnl_pcr(A_train, C_train, A_unknown, r) returns
    %   concentration matrix C_pcr based on the first r principal
    %   components of the singular values of A_train.  Multiplier
    %   matrix B_pcr is the pseudo-inverse of Beer's law extinction
    %   coefficient matrix such that C_pcr = A_unknown * B_pcr.
    %
    %   pnnl_pcr(A_train, C_train, A_unknown, r, meanCentered) applies mean
    %   centering when meanCentered is true, and does not apply mean
    %   centering when meanCentered is false.  When meanCentered is not
    %   supplied, the default is false (no mean centering).
    %
    %   Example:
    %
    %     load pnnl_napalm_data
    %     r = 3;
    %     [C_pcr, B_pcr] = pnnl_pcr(A_train, C_train, A_unknown, r);
    %
    %   See also pnnl_cls, pnnl_pls.

    % Copyright 2022-2023 Battelle Memorial Institute
    if nargin < 5
        meanCentered = false;
    end

    X = A_train;
    Y = C_train;
    if meanCentered
        X0 = X - mean(X,1);
        Y0 = Y - mean(Y,1);
    else
        X0 = X;
        Y0 = Y;
    end

    [U,S,V] = svd(X0,'econ');
    B_pcr = V(:,1:r) / S(1:r,1:r) * U(:,1:r)' * Y0;

    if meanCentered
        C_pcr = (A_unknown - mean(A_train,1)) * B_pcr + mean(C_train,1);
    else
        C_pcr = A_unknown * B_pcr;
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