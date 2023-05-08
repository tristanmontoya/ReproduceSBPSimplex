module TensorSimplexTests

    using JLD2
    using OrdinaryDiffEq
    using LinearAlgebra
    using LinearMaps: UniformScalingMap
    using GFlops
    using TimerOutputs
    using LaTeXStrings
    using UnPack
    using Arpack
    using KrylovKit: eigsolve
    using Dates
    using Suppressor
    using Plots
    using IterativeSolvers: powm
    using CLOUD

    
    export run_driver
    export AdvectionDriver
    include("advection_refinement.jl")
    export AdvectionPRefinementDriver
    include("advection_p_refinement.jl")
end
