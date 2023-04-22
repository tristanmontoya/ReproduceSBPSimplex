using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalMulti", element_type="Tri", λ=0.0, 
    l=7, mesh_perturb=0.05, n_grids=6, load_from_file=true))