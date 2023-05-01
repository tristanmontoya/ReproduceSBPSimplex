using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalTensor", element_type="Tet", λ=0.0, 
    l=2, mesh_perturb=1.0/16.0, n_grids=6, C_t=7.5e-4, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230501_small_step/", load_from_file=true))