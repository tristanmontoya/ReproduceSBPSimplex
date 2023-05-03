using CLOUD,JLD2

path = "../results/20230422/"

(root, dirs, files) = first(walkdir(path))

n_grids=5

for dir in dirs
    (subroot, subdirs, subfiles) = first(walkdir(string(path,dir,"/")))
    for subdir in subdirs
        save_object(string(path, dir, "/", subdir, "/errors.jld2"), Float64[])
        for n in 1:n_grids
            if isfile(string(path, dir, "/", subdir, 
                "/grid_", n, "/error.jld2"))
                errors=load_object(string(path, dir, "/", subdir, 
                    "/errors.jld2"))
                
                error=load(string(path, dir, "/", subdir,
                    "/grid_", n, "/error.jld2"))["error"][1]

                save_object(string(path, dir, "/", subdir, "/errors.jld2"),
                    push!(errors, error))
            end
        end
    end
end