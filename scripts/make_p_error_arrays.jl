using CLOUD, JLD2



paths = ["/project/z/zingg/tmontoya/TensorSimplexResults/20230429_p/NodalMulti_Tet_SkewSymmetricMapping/upwind/",
     "/project/z/zingg/tmontoya/TensorSimplexResults/20230429_p/NodalMulti_Tet_SkewSymmetricMapping/central/",
     "/project/z/zingg/tmontoya/TensorSimplexResults/20230429_p/ModalTensor_Tet_SkewSymmetricMapping/upwind/",
      "/project/z/zingg/tmontoya/TensorSimplexResults/20230429_p/ModalTensor_Tet_SkewSymmetricMapping/central/"]

p_min=2
p_max=25

for path in paths
    save_object(string(path, "poly_degrees.jld2"), Int64[])
    save_object(string(path, "errors.jld2"), Float64[])
    for p in p_min:p_max
        if !isfile(string(path, "p", p, "/", "error.jld2"))
            continue
        end
        errors=load_object(string(path, "errors.jld2"))
        error=load(string(path, "p", p, "/", "error.jld2"))["error"][1]

        poly_degrees=load_object(string(path, "poly_degrees.jld2"))
        save_object(string(path, "poly_degrees.jld2"),
            push!(poly_degrees, p))

        save_object(string(path, "errors.jld2"),
            push!(errors, error))
    end
end