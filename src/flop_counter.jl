# The manuscript's Float64 operation metric is 2 * muladd64 + add64 + mul64
mutable struct RHSFlopCounter <: AbstractBindingOverlay{nothing, nothing}
    muladd64::Int
    add64::Int
    mul64::Int
end

# Execute the residual with a counter local to each invocation
@inline function (count::RHSFlopCounter)(f::Core.IntrinsicFunction,
    args::Vararg{Float64, N}) where {N}

    if f === Core.Intrinsics.muladd_float
        count.muladd64 += 1
    elseif f === Core.Intrinsics.add_float
        count.add64 += 1
    elseif f === Core.Intrinsics.mul_float
        count.mul64 += 1
    end
    return f(args...)
end
