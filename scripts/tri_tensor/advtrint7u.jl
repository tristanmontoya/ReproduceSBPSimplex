using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="NodalTensor", element_type="Tri", λ=1.0, 
    l=3, mesh_perturb=1.0/16.0, n_grids=6, load_from_file=true))