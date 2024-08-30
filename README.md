# Efficient Tensor-Product Spectral-Element Operators with the Summation-by-Parts Property on Curved Triangles and Tetrahedra

This repository contains the Julia code to reproduce the results in the following manuscript:

T. Montoya and D. W. Zingg, [Efficient Tensor-Product Spectral-Element Operators with the Summation-by-Parts Property on Curved Triangles and Tetrahedra](https://arxiv.org/abs/2306.05975), SIAM Journal on Scientific Computing 46(4):A2270-A2297, 2024.

Please cite the above manuscript if you use this repository or the underlying spectral-element framework [StableSpectralElements.jl](https://github.com/tristanmontoya/StableSpectralElements.jl) in your research. 

## Abstract
We present an extension of the summation-by-parts (SBP) framework to tensor-product spectral-element operators in collapsed coordinates. The proposed approach enables the construction of provably stable discretizations of arbitrary order which combine the geometric flexibility of unstructured triangular and tetrahedral meshes with the efficiency of sum-factorization algorithms. Specifically, a methodology is developed for constructing triangular and tetrahedral spectral-element operators of any order which possess the SBP property (i.e. satisfying a discrete analogue of integration by parts) as well as a tensor-product decomposition. Such operators are then employed within the context of discontinuous spectral-element methods based on nodal expansions collocated at the tensor-product quadrature nodes as well as modal expansions employing Proriol-Koornwinder-Dubiner polynomials, the latter approach resolving the time step limitation associated with the singularity of the collapsed coordinate transformation. Energy-stable formulations for curvilinear meshes are obtained using a skew-symmetric splitting of the metric terms, and a weight-adjusted approximation is used to efficiently invert the curvilinear modal mass matrix. The proposed schemes are compared to those using non-tensorial multidimensional SBP operators, and are found to offer comparable accuracy to such schemes in the context of smooth linear advection problems on curved meshes, but at a reduced computational cost for higher polynomial degrees.

## Installation
First, make sure to [install the latest stable release of Julia](https://julialang.org/downloads/) if you haven't already done so. Then, assuming that you are using Linux or macOS and have git installed, follow the steps below.

1. Clone this repository by entering the command `git clone https://github.com/tristanmontoya/ReproduceSBPSimplex.git` in the terminal.

2. Within the top-level `ReproduceSBPSimplex` directory, use the command `julia --project=.` to open the Julia REPL and activate the project within the current directory.

3. Install all dependencies by entering `using Pkg; Pkg.instantiate()` in the REPL. This will automatically set up [StableSpectralElements.jl](https://github.com/tristanmontoya/StableSpectralElements.jl).

## Reproducibility instructions
Here, we describe how to generate the results using the provided scripts, and how to produce the results in the manuscript using the provided Jupyter notebooks. Note that some of the tests run a lot faster with multithreading enabled (for example, add `--threads 8` to the `julia` command if you want to use eight threads). If using multiple Julia threads, it is [usually best to set the number of BLAS threads to 1](https://carstenbauer.github.io/ThreadPinning.jl/dev/explanations/blas/) (for example, using the `OPENBLAS_NUM_THREADS` environment variable). The table below lists the scripts containing the appropriate calls to the driver file for each numerical experiment, as well as the notebooks used to postprocess the simulation results in order to generate the figures. If a directory is listed in the scripts column, then all scripts in the directory should be run (in any order).

|Description| Figure | Script(s) | Postprocessing notebooks| 
|---|---|---|---|
| Conservation and energy stability  | 2 | N/A  | [notebooks/stability_conservation_tri.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/stability_conservation_tri.ipynb) <br /> [notebooks/stability_conservation_tet.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/stability_conservation_tet.ipynb) |   
| Spectral radius  | 3  |  [scripts/sr_tri/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/sr_tri/) <br /> [scripts/sr_tet/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/sr_tet/) | [notebooks/spectral_radius_tri.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/spectral_radius_tri.ipynb) <br /> [notebooks/spectral_radius_tet.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/spectral_radius_tet.ipynb) | 
| Accuracy  |  4 | [scripts/h_refine_tri/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/h_refine_tri/) <br /> [scripts/p_refine_tri/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/p_refine_tri/) <br /> [scripts/h_refine_tet/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/h_refine_tet/) <br /> [scripts/p_refine_tet/](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/p_refine_tet/)  | [notebooks/convergence_plots_tri.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/convergence_plots_tri.ipynb) <br /> [notebooks/convergence_plots_tet.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/convergence_plots_tet.ipynb)   | 
| Operation count| 5 | [scripts/flops_tri.jl](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/flops_tri.jl) <br /> [scripts/flops_tet.jl](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/scripts/flops_tet.jl)|[notebooks/flops_tri.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/flops_tri.ipynb) <br /> [notebooks/flops_tet.ipynb](https://github.com/tristanmontoya/ReproduceSBPSimplex/tree/main/notebooks/flops_tet.ipynb)|

The data files directly used to generate the figures in the manuscript are provided in the `results` directory in HDF5-compatible [JLD2 format](https://github.com/JuliaIO/JLD2.jl), although the raw simulation datasets (which can be produced by running the above scripts) are not provided due to their size. Further inquiries regarding the code, results, and manuscript should be directed to [tristan.montoya@mail.utoronto.ca](mailto:tristan.montoya@mail.utoronto.ca).

## License

This software is released under the [GPLv3 license](https://www.gnu.org/licenses/gpl-3.0.en.html).