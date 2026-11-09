module ReproduceSBPSimplex

    using JLD2
    using OrdinaryDiffEq
    using OrdinaryDiffEq.SciMLBase: successful_retcode
    using LinearAlgebra
    using LinearMaps: UniformScalingMap
    using CassetteOverlay: AbstractBindingOverlay
    using TimerOutputs
    using LaTeXStrings
    using UnPack
    using Arpack
    using KrylovKit: eigsolve
    using Dates
    using Suppressor
    using IterativeSolvers: powm
    using StableSpectralElements

    
    export run_driver
    export AdvectionDriver
    include("advection_refinement.jl")
    include("flop_counter.jl")
    export AdvectionPRefinementDriver
    include("advection_p_refinement.jl")
end
