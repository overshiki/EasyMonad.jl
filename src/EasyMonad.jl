module EasyMonad

include("monad.jl")
include("macro.jl")

export Maybe, (>>), (<<), FunctionType, UnaryFunction, BinaryFunction, maybe_pass, @VectorMaybe

end # module EasyMonad
