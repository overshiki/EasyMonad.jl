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

test_func() = begin 
    a = 4
    func = UnaryFunction{Int, Int}(x->x*2) 
    @show a >> func 
    @show func << a

    a = nothing
    func = UnaryFunction{Int, Int}(x->x*2) 
    @show a >> func 
    @show func << a

    _func(x) = begin 
        x > 5 && return nothing 
        return x+1
    end

    a = 4
    func = UnaryFunction{Int, Maybe{Int}}(_func) 
    @show a >> func 
    @show func << a

    sa = collect(1:10)
    sa = map(a->a>>func, sa)
    @show typeof(sa)
    @show sa

    x = 1 
    y = 2 
    func = BinaryFunction{Int, Int, Int}((+))
    @show (x,y) >> func 
    @show func << (x,y)

end

test()
test_func()