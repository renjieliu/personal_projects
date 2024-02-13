function fib(n) {
    if (n<0)
    {
        return -1
    }
    if (n === 1 || n === 2)
    {
        return 1
    }
    var a = 1 
    var b = 1
    for(i=3 ; i<=n; i+=1)
    {
        c = a+b
        a = b
        b = c
    }
    return c 
}

console.log(fib(100))


