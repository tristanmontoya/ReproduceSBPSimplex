using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 25, scheme="ModalTensor", M0=2, 
    element_type="Tet", λ=0.0, l=2, mesh_perturb=1.0/16.0, path="/project/z/zingg/tmontoya/TensorSimplexResults/20230429_p/", load_from_file=true))