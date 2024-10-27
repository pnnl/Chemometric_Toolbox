# Pacific NorthWest National Laboratory Chemometric Toolbox


The PNNL Chemometric Toolbox in GitHub contains multiple MATLAB scripts and data files including: a live script which allows users to create univariate and multivariate regressions of the included napalm spectral data set; scripts for users to import and analyze their own data; function files; and the data set of IR spectra of napalm samples. This is available on GitHub at the following URL: [https://github.com/pnnl/Chemometric\_Toolbox](https://github.com/pnnl/Chemometric_Toolbox); [doi.org/10.11578/dc.20221003.1](doi.org/10.11578/dc.20221003.1)

The Supporting Information is available at [https://pubs.acs.org/doi/10.1021/acs.jchemed.2c01112](https://pubs.acs.org/doi/10.1021/acs.jchemed.2c01112).

[![Open in MATLAB Online](https://mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox)

## Examples

| MATLAB Live Script                         |  Description                                |
| ------------------------------------------ |  ------------------------------------------ |
| [BeersLawExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=BeersLawExample.mlx) | Beer's Law |
| [CLSExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=CLSExample.mlx) | Classical Least squares regression |
| [LatentVariableExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=LatentVariableExample.mlx) | SIMPLS latent variables |
| [PCRExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PCRExample.mlx) | Principal component regression |
| [PLS1Example](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PLS1Example.mlx) | Partial least squares with a single constituent |
| [PLS2Example](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PLS2Example.mlx) | Partial least squares with multiple constituents|
| [PLSMeanCenteringExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PLSMeanCenteringExample.mlx) | Partial least squares with mean centering |
| [PNNL\_and\_Me\_Chemometric\_Toolbox](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PNNL_and_Me_Chemometric_Toolbox.mlx) | How to build chemometric models with your own data |
| [PNNL\_and\_Me\_Format\_My\_Data](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PNNL_and_Me_Format_My_Data.mlx) | How to format your own data for use with PNNL Chemometric Toolbox |
| [PNNL\_Chemometric\_Methods](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PNNL_Chemometric_Methods.mlx) | How to use the methods in the PNNL Chemometric Toolbox |
| [PrincipalComponentTrainVsValidateExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=PrincipalComponentTrainVsValidateExample.mlx) | Plot principal component training and validation scores together |
| [ReadSpectrometerDatasetExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=ReadSpectrometerDatasetExample.mlx) | How to load spectrometer datasets from multiple files |
| [RegressionCoefficientExample](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=RegressionCoefficientExample.mlx) | How to compute regression coefficient matrices for classical least squares |

## Chemometric Methods
| Function | Description |
| -------- | ------------|
| [pnnl\_cls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_cls.m) | Classical least squares regression |
| [pnnl\_pcr](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_pcr.m) | Principal component regression |
| [pnnl\_pls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_pls.m) | Partial least squares regression |


## Algorithms
| Function | Description |
| -------- | ------------|
| [pnnl\_simpls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_simpls.m) | SIMPLS algorithm | 
| [pnnl\_rmse](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_rmse.m) | Root mean squared error |

## Analysis
| Function | Description |
| -------- | ------------|
| [pnnl\_compute\_predictions](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_compute_predictions.m) | Compute predictions |
| [pnnl\_cross\_validation](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_cross_validation.m) | Cross validation |
| [pnnl\_normalize\_rows](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_normalize_rows.m) | Normalize the rows of a matrix |
| [pnnl\_predictions](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_predictions.m) | Return predicted concentrations |
| [pnnl\_read\_spectrometer\_dataset](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_read_spectrometer_dataset.m) | Read spectrometer dataset |
| [pnnl\_rectifiedSVD](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_rectifiedSVD.m) | Singular value decomposition with rectified V |
| [pnnl\_rectify\_rows](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_rectify_rows.m) | Rectify the rows of a matrix |
| [pnnl\_single\_constituent\_analysis](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_single_constituent_analysis.m) | Single constituent analysis |

## Plotting
| Function | Description |
| -------- | ------------|
| [pnnl\_addbars](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_addbars.m) | Add toolbar to plot |
| [pnnl\_colorOrder](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_colorOrder.m) | Color order for plots |
| [pnnl\_display\_array](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_display_array.m) | Display array with row and column labels |
| [pnnl\_display\_rmse](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_display_rmse.m) | Display root-mean-squared-errors |
| [pnnl\_model\_plot\_unformatted](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_model_plot_unformatted.m) | Display model constituents |
| [pnnl\_plot\_concentration](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_plot_concentration.m) | Plot concentrations |
| [pnnl\_plot\_predictions](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_plot_predictions.m) | Return predicted concentrations |
| [pnnl\_plot\_scores](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_plot_scores.m) | Plot scores |
| [pnnl\_plot\_scores\_train\_vs\_unknown](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_plot_scores_train_vs_unknown.m) | Plot scores of train vs. unknown |
| [pnnl\_strip\_plot](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_strip_plot.m) | Strip plot |

## Functions for working with the napalm data
These functions are designed to only work with the napalm data supplied in this toolbox.  You can copy, rename, and modify them to use as examples of how to work with your own datasets.

| Function | Description |
| -------- | ------------|
| [pnnl\_napalm\_cls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_cls.m) | Classical Least Squares regression on the napalm data |
| [pnnl\_napalm\_pcr](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_pcr.m) | Principal component regression (PCR) on the napalm data |
| [pnnl\_napalm\_plot\_pure\_spectra](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_pure_spectra.m) | Plot pure spectra of napalm data |
| [pnnl\_napalm\_plot\_pure\_spectra\_same\_axis](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_pure_spectra_same_axis.m) | Plot pure napalm spectra on the same axis |
| [pnnl\_napalm\_plot\_pure\_spectra\_vs\_K\_cls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_pure_spectra_vs_K_cls.m) | Plot pure napalm spectra vs K\_cls |
| [pnnl\_napalm\_plot\_scores](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_scores.m) | Plot scores of napalm data |
| [pnnl\_napalm\_plot\_spectra](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_spectra.m) | Plot napalm spectra |
| [pnnl\_napalm\_plot\_training\_spectra](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_training_spectra.m) | Plot napalm training spectra |
| [pnnl\_napalm\_plot\_unknown\_spectra](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_plot_unknown_spectra.m) | Plot napalm unknown spectra |
| [pnnl\_napalm\_pls](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_pls.m) | Partial least squares (PLS) regression on the napalm data |
| [pnnl\_napalm\_pure\_spectra](https://matlab.mathworks.com/open/github/v1?repo=pnnl/Chemometric_Toolbox&file=pnnl_napalm_pure_spectra.m) | Napalm pure spectra |



# A Practical Guide to Chemometric Analysis of Optical Spectroscopic Data.

  Hope E. Lackey,1,2 Rachel L. Sell,1 Gilbert L. Nelson,3* 
  Thomas A. Bryan,4* Amanda M. Lines,1,2* Samuel A. Bryan1,2* 

1. Pacific Northwest National Laboratory, 902 Battelle Boulevard,
  Richland, WA 99352 
2. Washington State University, Department of Chemistry, Pullman
  WA 99164 
3. College of Idaho, Department of Chemistry, 2112 Cleveland Blvd,
  Caldwell, ID 83605 
4. The MathWorks, 3 Apple Hill Drive, Natick, MA 01760-2098


* Email: sam.bryan@pnnl.gov Phone 1 509 375 5648;
        orcid.org/0000-0002-8826-0880 
* Email: tbryan@mathworks.com Phone 1 508 647 7669
* Email: amanda.lines@pnnl.gov Phone: 1 509 375 5689
* Email: gnelson@collegeofidaho.edu Phone: 1 208 459 5241

# Disclaimer

This material was prepared as an account of work sponsored by an agency
of the United States Government.  Neither the United States Government
nor the United States Department of Energy, nor Battelle, nor any of
their employees, nor any jurisdiction or organization that has cooperated
in the development of these materials, makes any warranty, express or
implied, or assumes any legal liability or responsibility for the
accuracy, completeness, or usefulness or any information, apparatus,
product, software, or process disclosed, or represents that its use would
not infringe privately owned rights.

Reference herein to any specific commercial product, process, or service
by trade name, trademark, manufacturer, or otherwise does not necessarily
constitute or imply its endorsement, recommendation, or favoring by the
United States Government or any agency thereof, or Battelle Memorial
Institute. The views and opinions of authors expressed herein do not
necessarily state or reflect those of the United States Government or any
agency thereof.

                 PACIFIC NORTHWEST NATIONAL LABORATORY
                              operated by
                                BATTELLE
                                for the
                   UNITED STATES DEPARTMENT OF ENERGY
                    under Contract DE-AC05-76RL01830




# Copyright
Copyright 2022 Battelle Memorial Institute

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**
