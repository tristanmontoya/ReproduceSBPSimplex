using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalMulti", element_type="Tet", λ=0.0, 
    l=3, n_grids=6, load_from_file=true))