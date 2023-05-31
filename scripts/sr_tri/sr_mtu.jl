using ReproduceSBPSimplex

run_driver(AdvectionPRefinementDriver(2, 16, scheme="ModalTensor", M0=2,
    element_type="Tri", λ=1.0, l=3, mesh_perturb=1.0/16.0, run=false, spectral_radius=true, path="./results/spectral_radius/", load_from_file=true))