using TensorSimplexTests

run_driver(AdvectionDriver(4, scheme="NodalMulti", element_type="Tri", λ=1.0, 
    l=3, n_grids=6, load_from_file=true))