using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 12, scheme="ModalTensor", M0=2,
    element_type="Tet", λ=1.0, l=2, mesh_perturb=0.05, load_from_file=true))