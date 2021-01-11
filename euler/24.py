# def perm1(lst):
	# if len(lst)==0:
		# return []
	# elif len(lst)==1:
		# return [lst]
	# else:
		# return_lst = []
		# for i in range(0, len(lst)):
			# x = lst[i]
			# xs = lst[:i] + lst[i+1:]
			# for p in perm1(xs):
				# return_lst.append([x]+p)
		
		# return return_lst

# data  = list('hdsfkahkfjalsfjajfpojadfaj;okfjadjfasjfla')
# print('Perm1')

# for x in perm1(data):
	# print(x)

	
def perm2(lst):
	if len(lst)==0:
		yield []
	elif len(lst)==1:
		yield [lst]
	else:
		return_lst = []
		for i in range(0, len(lst)):
			x = lst[i]
			xs = lst[:i] + lst[i+1:]
			for p in perm2(xs):
				yield [x]+p
		
		 

data  = list('0123456789')
print('Perm2')

set = []
for x in perm2(data):
	set.append(x)
print(set[999999])
		









