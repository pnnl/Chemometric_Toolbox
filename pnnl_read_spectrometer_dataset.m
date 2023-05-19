function [AbsorbanceMatrix, Wavenumbers] = pnnl_read_spectrometer_dataset(directory_name, file_extension)
    % pnnl_read_spectrometer_dataset Read spectrometer dataset
    %
    %   [AbsorbanceMatrix, Wavenumbers] = ...
    %       pnnl_read_spectrometer_dataset(directory_name, file_extension)
    %
    %   reads all files in a directory specified by directory_name with
    %   file extension specified by file_extension.
    %
    %   If no directory name is specified, or if the directory name is an
    %   empty string, then the files are read from the current directory.
    %
    %   If no file extension is specified, or if file extension is an empty
    %   string, then a file extension of 'txt' is used.
    %
    %   [AbsorbanceMatrix, Wavenumbers] = pnnl_read_spectrometer_dataset
    %   with no additional input arguments reads all files in the current
    %   directory with file extension 'txt'.
    %
    %   Files whose names start with '._' are ignored.  They are assumed to
    %   be file attributes created by Mac computers.
    %
    %   Example:
    %
    %     training_data_directory_name = ...
    %         fullfile('pnnl_spectrometer_data', ...
    %                  'pnnl_napalm_training_dataset');
    %     file_extension = 'txt';
    %     [A_train, Wavenumbers] = ...
    %         pnnl_read_spectrometer_dataset(training_data_directory_name, ...
    %                                        file_extension);
    %     plot(Wavenumbers,A_train)
    %     xlabel('Wavenumber (cm^{-1})')
    %     ylabel('Absorbance')
    %     title('Training Spectra')

    % Copyright 2022-2023 Battelle Memorial Institute
    if nargin < 1
        directory_name = "";
    end
    if nargin < 2
        file_extension = "";
    end
    if isempty(directory_name) || isequal(directory_name,'')
        directory_name = ".";
    end
    if isempty(file_extension) || isequal(file_extension,'')
        file_extension = "txt";
    end
    
    % Consistently work with strings
    directory_name = string(directory_name);
    file_extension = string(file_extension);
    % Remove a dot in file extension if it exists, so both ".txt" and "txt"
    % are valid ways to enter a file extension.
    file_extension = strrep(file_extension,".","");
    d = dir(fullfile(directory_name, "*."+file_extension));
    if isempty(d)
        error("No files were found in directory '" + directory_name + ...
            "' with extension '" + file_extension + ...
            "'.  Check that you are in the correct directory and " + ...
            "you have specified the directory name and " + ...
            "file extension correctly.");
    end
    % Remove all files from the directory listing that begin with "._"
    % Files that start with "._" are extended attribute files on Mac
    % computers and are not part of the dataset.
    removeMe = startsWith({d(:).name},'._');
    d(removeMe) = [];
    % Read the first file to get Wavenumbers and Absorbance Matrix size
    X = readmatrix(fullfile(d(1).folder,d(1).name));
    % The wavenumbers are in the first row of the data.
    % The wavenumbers are assumed to be identical in each file.
    Wavenumbers = X(1,:);
    AbsorbanceMatrix = zeros(length(d),size(X,2));
    for k = 1:length(d)
        % Read the data, one file at a time.
        X = readmatrix(fullfile(d(k).folder,d(k).name));
        % The absorbance data is in the second row in the file.
        AbsorbanceMatrix(k,:) = X(2,:);
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