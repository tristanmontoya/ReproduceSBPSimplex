using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 12, scheme="ModalTensor", M0=4,
    element_type="Tri", λ=1.0, l=3, mesh_perturb=0.05, load_from_file=true))