using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 16, scheme="ModalTensor", M0=2,
    element_type="Tet", λ=1.0, l=2, mesh_perturb=1.0/16.0, load_from_file=true))
