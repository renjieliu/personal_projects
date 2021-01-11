def fib(n):
	if n==1:
		return 1
	elif n==2:
		return 2
	else: 
		return fib(n-1) + fib(n-2)

list = []
i = 1
while fib(i)<4000000:
	num = fib(i)
	i+=1
	if num%2==0:
		list.append(num)
	

sum = 0
for obj in list:
	sum+=obj

print(sum)
		