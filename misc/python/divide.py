def divide(A, B): # div (100, 15)
  if A == 0:
    return 0
  elif B== 0:
    return 'NA' 
  else: 
    cnt = 0
    p = A // B
    mod = A%B #10 
    mod_arr = []
    if mod ==0:
      return str(p) 
    else:
      output = str(p) + '.'
      while mod not in mod_arr:
        mod_arr.append(mod)
        output+= str(mod//B)
        mod = mod%B
        mod*=10
    return output

print(divide(1234, 12341))    

  




