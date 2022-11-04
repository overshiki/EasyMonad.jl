module EasyMonad

include("monad.jl")
include("macro.jl")
export Maybe, (>>), (<<), FunctionType, UnaryFunction, BinaryFunction, @VectorMaybe

end # module EasyMonad
