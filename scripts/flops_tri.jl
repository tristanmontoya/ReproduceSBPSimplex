using TensorSimplexTests

drivers = [AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="NodalMulti",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_reference/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="ModalMulti",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_reference/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="NodalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="DefaultOperatorAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_reference/", M0=1, run=false, flops=true), 
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="ModalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="ReferenceOperator",
        operator_algorithm="DefaultOperatorAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_reference/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="NodalMulti",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_physical/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="ModalMulti",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_physical/", M0=1, run=false, flops=true),
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="NodalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_physical/", M0=1, run=false, flops=true), 
    AdvectionPRefinementDriver(2,25, element_type="Tri", scheme="ModalTensor",
        mapping_form="SkewSymmetricMapping", 
        strategy="PhysicalOperator",
        operator_algorithm="GenericMatrixAlgorithm",
        path="/project/z/zingg/tmontoya/TensorSimplexResults/20230502_flop_count_physical/", M0=1, run=false, flops=true)]

Threads.@threads for driver in drivers
    run_driver(driver)
end