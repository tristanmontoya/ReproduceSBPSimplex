using TensorSimplexTests

run_driver(AdvectionDriver(7, scheme="ModalTensor", element_type="Tri", λ=1.0, 
    l=7, mesh_perturb=0.05, C_t=2.5e-4, path="../../results/20230422_fast/", strategy="PhysicalOperator",n_grids=6, load_from_file=true))