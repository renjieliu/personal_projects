hmp={}
dates = []
for i in range(1,13):
  if i in [1,3,5,7,8,10,12]:
    hmp[i] = 31
  elif i in [4,6,9,11]:
    hmp[i] = 30
  else:
    hmp[2] = 29
for k, v in hmp.items():
  if k < 10:
    for x in range(1, v+1):
      if x < 10:
        dates.append('0'+str(k) + '0' + str(x))
      else:
        dates.append('0'+str(k) + str(x))
  else:
    for x in range(1, v+1):
      if x < 10:
        dates.append(str(k) + '0' + str(x))
      else:
        dates.append(str(k) + str(x))
output = []
for d in dates:
  output.append(d[::-1] + d)
output.sort()
print(output)

