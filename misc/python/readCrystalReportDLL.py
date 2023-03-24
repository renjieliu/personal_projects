import ctypes

# Load the DLL
my_dll = ctypes.cdll.LoadLibrary('path/to/my_dll.dll')

# Define the argument and return types for the function
my_function = my_dll.my_function
my_function.argtypes = [ctypes.c_int, ctypes.c_int]
my_function.restype = ctypes.c_int

# Call the function
result = my_function(1, 2)


