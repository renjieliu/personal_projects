import random

def generateCC(num): # filling the first 15 digit 
    while len(num) < 15:  
        num.append(random.choice(range(0, 10)))

    total = 0
    for i, c in enumerate(reversed(num)): # calculate the current sum, reversed 
        if i % 2: # only 15 digits now. Reverse the luhn sum rule, i starts from 0 
            total += c 
        else: 
            total += c*2 - (0 if c*2 <= 9 else 9) 
    
    num.append( 0 if total % 10 == 0 else 10 - total % 10 ) # generate the 

def luhn(arr): # check the luhn sum 
    output = 0
    for i , c in enumerate(reversed(arr)):
        if i % 2 :
            output += c*2 - (0 if c*2 <= 9 else 9)  
        else:
            output += c 
    print(output)

count = 100
for i in range(count): 
    num = [4]
    generateCC(num)
    print(''.join(str(_) for _ in num))




