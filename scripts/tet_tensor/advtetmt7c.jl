using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalTensor", element_type="Tet", λ=0.0, 
    l=4, mesh_perturb=0.05, n_grids=6, load_from_file=true))