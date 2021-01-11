def pre(arr):
  output = [] 
  i = 0 
  while i < len(arr):
    curr = arr[:i+1]
    m = 0
    j = 0
    while j < len(curr)-1:
      if curr[:j+1] == curr[-(j+1):]:
        m = max(m,len(curr[:j+1]))
      j+=1
    output.append(m)
    i+=1
  return [-1] + output[:-1]

def search(s, t): #to seach s loc in t 
  output = []
  if len(t)<len(s):
    return [] #not found
  i = 0
  j = 0 
  lkp = pre(s)
  while i < len(t):
    if s[j] == t[i] and j == len(s)-1: 
      output.append(i-(len(s)-1))
      j =lkp[j]
    if s[j]==t[i]:
      i+=1 
      j+=1
    else:
      j = lkp[j]
      if j == -1:
        j+=1
        i+=1 
  return output

print(search('aab','aaaabaab'))
# print(search ('a','aaab'))

      
    
