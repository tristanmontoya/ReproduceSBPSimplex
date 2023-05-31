using ReproduceSBPSimplex

run_driver(AdvectionDriver(4, scheme="NodalTensor", element_type="Tet", λ=1.0, 
    l=2, mesh_perturb=1.0/16.0, n_grids=6, C_t=7.5e-4, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230501_small_step/", load_from_file=true))