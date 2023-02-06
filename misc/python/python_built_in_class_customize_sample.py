# RL added on 2021-11-30

class list: #override the internal class
    def __init__(self, val):
        self.val = val
        print(f"hello list {val}")
        
    def __add__(self, b): # operator "+" overloading
        print("adding..")
        return self.val * b.val

a = list(100)
b = list(200)

print(a + b)




