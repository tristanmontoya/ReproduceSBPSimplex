using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 10, scheme="NodalMulti", M0=2,
    element_type="Tet", λ=0.0, l=2, mesh_perturb=1.0/16.0, run=false, spectral_radius=true, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230430_sr/", load_from_file=true))