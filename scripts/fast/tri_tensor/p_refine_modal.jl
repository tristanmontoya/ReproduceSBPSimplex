using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 12, scheme="ModalTensor", M0=4,
    element_type="Tri", λ=1.0, l=3, mesh_perturb=0.05, C_t=2.5e-4, path="../../results/20230422_fast/", strategy="PhysicalOperator",load_from_file=true))