include("src/monad.jl")

test() = begin 
    a = 4
    func = x->x*2 
    @show a >> func 
    @show func << a

    func(x) = begin 
        x > 5 && return nothing 
        return x+1
    end

    for i in 1:5
        @show i
        @show i >> func >> func >> func
        @show func << (func << (func << i))
    end
end

test()