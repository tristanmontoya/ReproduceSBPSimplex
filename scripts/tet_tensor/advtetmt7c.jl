using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalTensor", element_type="Tet", λ=0.0, 
    l=2, mesh_perturb=1.0/16.0, n_grids=6, C_t=1.0e-3, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230429/", load_from_file=true))