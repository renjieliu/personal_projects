def is_Recycled(num1, num2):
	output = 0
	num2 = str(num2)
	if len(str(num1))==1 or len(str(num1)) != len(str(num2)) or num1 == num2: #or sorted(str(num1))!= sorted(str(num2)): 
		output= 0	
	else:
		for i in range(1, len(num2)):
			if  int(str(num2[i:])+ str(num2[0:i]) ) == num1:
				output = 1
				breakd
	return output


def result(n,m):
	count = 0
	for i in range(n, m+1):
		for j in range(i+1, m+1):  # int("1" + "0"*int(len(str(i))))-1 #this is to get the biggest number of the same digits, 1643 -- returns 9999
			if j%100 ==0:
				print(j)
			
			if sorted(str(i))!= sorted(str(j)):
				continue
				
			else:
				if is_Recycled(i, j) == 1:
					count+= 1
	return count

# print("Case #1: ", end = "")
# print(result(1093515,1975348))


def recycle_count(num1, num2):
	count = 0
	for curr in range(num1, num2+1):
		n=str(curr)
		list = []
		for i in range(1, len(n)):	
			combo = int(str(n[i:])+ str(n[0:i]))
			if  curr<combo and combo <= num2 and str(curr) + "-" + str(combo) not in list:
				count+=1
				list.append(str(curr) + "-" + str(combo))
				#print(f"{curr},{combo}")
	return count

	
	

print("Case #1: ", end = "")
print(recycle_count(1069514,1946556))

print("Case #2: ", end = "")
print(recycle_count(69157,74401))
print("Case #3: ", end = "")
print(recycle_count(484,954))
print("Case #4: ", end = "")
print(recycle_count(159887,195662))
print("Case #5: ", end = "")
print(recycle_count(16611,61695))
print("Case #6: ", end = "")
print(recycle_count(1069712,1980470))
print("Case #7: ", end = "")
print(recycle_count(1010,1294))
print("Case #8: ", end = "")
print(recycle_count(1053415,1938602))
print("Case #9: ", end = "")
print(recycle_count(100,101))
print("Case #10: ", end = "")
print(recycle_count(1795938,1958424))
print("Case #11: ", end = "")
print(recycle_count(1076393,1101254))
print("Case #12: ", end = "")
print(recycle_count(509321,987048))
print("Case #13: ", end = "")
print(recycle_count(1436468,1883090))
print("Case #14: ", end = "")
print(recycle_count(382401,594427))
print("Case #15: ", end = "")
print(recycle_count(1324,3755))
print("Case #16: ", end = "")
print(recycle_count(1065374,1950079))
print("Case #17: ", end = "")
print(recycle_count(283,788))
print("Case #18: ", end = "")
print(recycle_count(1960849,1960849))
print("Case #19: ", end = "")
print(recycle_count(384,750))
print("Case #20: ", end = "")
print(recycle_count(1007197,1985768))
print("Case #21: ", end = "")
print(recycle_count(44297,50998))
print("Case #22: ", end = "")
print(recycle_count(1235312,1882974))
print("Case #23: ", end = "")
print(recycle_count(100000,100000))
print("Case #24: ", end = "")
print(recycle_count(1079742,1491500))
print("Case #25: ", end = "")
print(recycle_count(21,31))
print("Case #26: ", end = "")
print(recycle_count(1030507,1957671))
print("Case #27: ", end = "")
print(recycle_count(1387415,1765422))
print("Case #28: ", end = "")
print(recycle_count(40011,49038))
print("Case #29: ", end = "")
print(recycle_count(1029932,1984145))
print("Case #30: ", end = "")
print(recycle_count(34,70))
print("Case #31: ", end = "")
print(recycle_count(51821,95964))
print("Case #32: ", end = "")
print(recycle_count(651767,651767))
print("Case #33: ", end = "")
print(recycle_count(1072779,1959216))
print("Case #34: ", end = "")
print(recycle_count(100000,999999))
print("Case #35: ", end = "")
print(recycle_count(1093515,1975348))
print("Case #36: ", end = "")
print(recycle_count(1219153,1375716))
print("Case #37: ", end = "")
print(recycle_count(1043299,1944882))
print("Case #38: ", end = "")
print(recycle_count(354850,915014))
print("Case #39: ", end = "")
print(recycle_count(6,7))
print("Case #40: ", end = "")
print(recycle_count(5029,5426))
print("Case #41: ", end = "")
print(recycle_count(1068734,1946365))
print("Case #42: ", end = "")
print(recycle_count(1042469,1993677))
print("Case #43: ", end = "")
print(recycle_count(1059237,1972939))
print("Case #44: ", end = "")
print(recycle_count(1000,9999))
print("Case #45: ", end = "")
print(recycle_count(568578,916014))
print("Case #46: ", end = "")
print(recycle_count(8013,8403))
print("Case #47: ", end = "")
print(recycle_count(1033044,1990734))
print("Case #48: ", end = "")
print(recycle_count(1036187,1995973))
print("Case #49: ", end = "")
print(recycle_count(458516,555845))
print("Case #50: ", end = "")
print(recycle_count(1067827,1917733))