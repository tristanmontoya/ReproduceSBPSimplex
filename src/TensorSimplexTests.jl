module TensorSimplexTests

    using OrdinaryDiffEq
    using LinearAlgebra
    using LinearMaps: UniformScalingMap
    using TimerOutputs
    using LaTeXStrings
    using UnPack
    using Dates
    using Suppressor
    using Plots
    using CLOUD

    export run_driver
    export AdvectionDriver, AdvectionPRefinementDriver
    include("advection_refinement.jl")
    include("advection_p_refinement.jl")
end