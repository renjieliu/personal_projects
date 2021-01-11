def read(n):
	dict={	1:3,
			2:3,
			3:5,
			4:4,
			5:4,
			6:3,
			7:5,
			8:5,
			9:4,
			10:3,
			11:6,
			12:6,
			13:8,
			14:8,
			15:7,
			16:7,
			17:9,
			18:8,
			19:8,
			20:6,
			30:6,
			40:5,
			50:5,
			60:5,
			70:7,
			80:6,
			90:6,
			100:7
		}

	if n>=1 and n <=20:
		return dict[n]
	
	if n>20 and n<100:
		if n%10 != 0:
			return dict[10*(n//10)] + dict[n-10*(n//10)]
		else:
			return dict[n]
	
	if n>=100 and n<1000:
		if n%100>=1 and n%100 <=20:
			return 3+dict[n//100]+dict[100]+dict[n%100]
		elif n%100>20:
			if n%100%10 != 0:
				return 3+dict[n//100]+dict[100] + dict[10*((n%100)//10)] + dict[(n%100)-10*((n%100)//10)]
			else:
				return 3+dict[n//100]+dict[100] + dict[n%100]
			
		else:
			return dict[n//100]+dict[100]


			

sum = 0

for i in range(1,1000):
	sum+=read(i)
	print(i)
print(sum+11) #1000 is 11
	

# h = n//100
# t = round((n-100*h),-1)
# d = (n-100*h)-t

# print(dict[h])
# print(dict[t])
# print(dict[d])


# print(round(104, -2))





