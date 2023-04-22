using TensorSimplexTests

run_driver(AdvectionPRefinementDriver(2, 12, scheme="ModalTensor", M0=2,
    element_type="Tet", λ=1.0, l=2, mesh_perturb=0.05, C_t=2.5e-4, path="../../results/20230422_fast/", strategy="PhysicalOperator",load_from_file=true))