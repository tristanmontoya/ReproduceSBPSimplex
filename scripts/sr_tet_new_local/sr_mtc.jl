using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(9, 25, scheme="ModalTensor", M0=2,
    element_type="Tet", λ=0.0, l=2, mesh_perturb=1.0/16.0, run=false, spectral_radius=true, path="../results/sr_tet_local/", load_from_file=true))