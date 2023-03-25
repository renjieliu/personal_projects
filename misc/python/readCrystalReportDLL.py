import ctypes

# Load the DLLs

dll_path = r"C:\Users\liurenjie\Desktop\Stafflist\CrystalReportBurst\CrystalDecisions.CrystalReports.Engine.dll"

# Load the DLL
my_dll = ctypes.WinDLL(dll_path)

# Iterate through the exported functions
for func in my_dll.__dict__:
    print(func)
    if isinstance(my_dll.__dict__[func], ctypes._CFuncPtr):
        print(func)

