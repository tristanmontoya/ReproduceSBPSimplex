using ReproduceSBPSimplex

run_driver(AdvectionDriver(4, scheme="NodalTensor", element_type="Tri", λ=1.0, 
    l=3, mesh_perturb=1.0/16.0, n_grids=6, C_t=1.0e-3, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230429/", load_from_file=true))