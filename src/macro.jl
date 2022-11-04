include("monad.jl")
using MacroTools: prewalk, postwalk, @capture
"""
some usefull macro for Maybe transparent monad
"""

function VectorMaybe_func(t, ex)
    if ex isa Expr
        ex.head == :vect && return :(Vector{Maybe{$t}}($ex))
    end
    return ex
end

macro VectorMaybe(t, ex)
    return postwalk(ex) do x 
        return VectorMaybe_func(t, x)
    end |> esc
end


