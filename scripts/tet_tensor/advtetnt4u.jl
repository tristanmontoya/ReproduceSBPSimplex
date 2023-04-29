using TensorSimplexTests

run_driver(AdvectionDriver(4, scheme="NodalTensor", element_type="Tet", λ=1.0, 
    l=2, mesh_perturb=0.05, n_grids=6, load_from_file=true))