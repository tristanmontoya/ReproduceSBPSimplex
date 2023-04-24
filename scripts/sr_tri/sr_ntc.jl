using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 16, scheme="NodalTensor", M0=4,
    element_type="Tri", λ=0.0, l=3, mesh_perturb=1.0/16.0, run=false, spectral_radius=true, load_from_file=true))