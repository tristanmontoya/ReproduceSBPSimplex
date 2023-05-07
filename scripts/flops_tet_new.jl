using TensorSimplexTests

drivers = [
    AdvectionPRefinementDriver(17,25, element_type="Tet", scheme="NodalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="DefaultOperatorAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230505_flop_count_reference/", M0=1, run=false, flops=true), 
    AdvectionPRefinementDriver(17,25, element_type="Tet", scheme="ModalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="DefaultOperatorAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230505_flop_count_reference/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(17,25, element_type="Tet", scheme="NodalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230505_flop_count_physical/", M0=1, run=false, flops=true), 
    AdvectionPRefinementDriver(17,25, element_type="Tet", scheme="ModalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230505_flop_count_physical/", M0=1, run=false, flops=true)]

Threads.@threads for driver in drivers
    run_driver(driver)
end
