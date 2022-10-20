
"""
Just treat Union{T, Nothing} to be a easy Maybe monad, or transparent Maybe monad. The reason I call it transparent is because the value is not wrapped in a struct, as normally a monad requires. This treatment is beneficial because we do not need to wrap the value into the monad again and over again, i.e. the return/inject function is just a null function. To guarantee that the object is always in the monad, we merely rely on the correponding bind function, i.e. the bind function will always accept a monad and return a monad.
"""
const Maybe{T} = Union{T, Nothing}

"""
Monad bind: M [a] -> ([a] -> b) -> M b
this one is really convenient
note that the symbol >> in haskell has a different meaning. Actually, this function is represented by >>= in haskell
"""
(>>)(x::Maybe{T}, f::Function) where T = begin
    x isa Nothing && return x 
    return f(x)
end

(<<)(f::Function, x::Maybe{T}) where T = x >> f