using TensorSimplexTests

run_driver(AdvectionDriver(4, scheme="ModalTensor", element_type="Tet", λ=1.0, 
    l=3, n_grids=6, load_from_file=true))