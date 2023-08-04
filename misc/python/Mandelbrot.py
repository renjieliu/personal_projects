import math

def mandelbrot(z , c , iteration_cnt = 40):
    if abs(z) > 1000:
        return float("nan")
    elif iteration_cnt > 0: #Fc(z) = z**2 + c
        return mandelbrot(z ** 2 + c, c, iteration_cnt - 1)
    else:
        return z ** 2 + c
		
		
		
arr = []
for y in [a * 0.06 for a in range(-20, 20)]:
    arr.append([])
    for x in [a * 0.02 for a in range(-80, 30)]:
        if math.isnan(mandelbrot(0, x + 1j * y).real):
            arr[-1].append(" ")
        else:
            arr[-1].append("*")
arr
res = []
for a in arr:
    res.append("".join(a))

print("\n".join(res))


