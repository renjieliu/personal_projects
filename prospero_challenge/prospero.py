import math

# ==========================
# Configuration
# ==========================

IMAGE_SIZE = 128  # Resolution of the generated image
SPACE = [-1 + 2 * i / (IMAGE_SIZE - 1) for i in range(IMAGE_SIZE)]  # Coordinate range from -1 to 1

# ==========================
# Coordinate Grid Creation
# ==========================

# Create 2D grids for X and Y coordinates.
# Each pixel in the image corresponds to (x[i][j], y[i][j]).
GRID_X = [[SPACE[j] for j in range(IMAGE_SIZE)] for _ in range(IMAGE_SIZE)]
GRID_Y = [[-SPACE[i] for _ in range(IMAGE_SIZE)] for i in range(IMAGE_SIZE)]

# This dictionary stores variable names and their corresponding 2D array values.
variables = {}

# ==========================
# Utility Functions
# ==========================

def apply_binary_operation(array_a, array_b, operation):
    """
    Apply a binary (two-operand) operation element-wise between two 2D arrays.
    Example: addition, subtraction, multiplication, min, max
    """
    return [
        [operation(array_a[i][j], array_b[i][j]) for j in range(IMAGE_SIZE)]
        for i in range(IMAGE_SIZE)
    ]


def apply_unary_operation(array_a, operation):
    """
    Apply a unary (single-operand) operation element-wise to a 2D array.
    Example: negation, square, sqrt
    """
    return [
        [operation(array_a[i][j]) for j in range(IMAGE_SIZE)]
        for i in range(IMAGE_SIZE)
    ]

# ==========================
# VM Program Execution
# ==========================

last_variable_name = None  # Tracks the most recent variable (the final output)

with open("prospero.vm", "r", encoding="utf-8") as file:
    for raw_line in file:
        line = raw_line.strip()
        if not line or line.startswith("#"):  # Skip comments and blank lines
            continue

        # Split instruction line into output variable, opcode, and arguments
        out_name, opcode, *args = line.split()
        last_variable_name = out_name

        # Dispatch table — perform the correct operation
        if opcode == "var-x":
            variables[out_name] = GRID_X

        elif opcode == "var-y":
            variables[out_name] = GRID_Y

        elif opcode == "const":
            constant_value = float(args[0])
            variables[out_name] = [[constant_value] * IMAGE_SIZE for _ in range(IMAGE_SIZE)]

        elif opcode == "add":
            variables[out_name] = apply_binary_operation(variables[args[0]], variables[args[1]], lambda a, b: a + b)

        elif opcode == "sub":
            variables[out_name] = apply_binary_operation(variables[args[0]], variables[args[1]], lambda a, b: a - b)

        elif opcode == "mul":
            variables[out_name] = apply_binary_operation(variables[args[0]], variables[args[1]], lambda a, b: a * b)

        elif opcode == "max":
            variables[out_name] = apply_binary_operation(variables[args[0]], variables[args[1]], max)

        elif opcode == "min":
            variables[out_name] = apply_binary_operation(variables[args[0]], variables[args[1]], min)

        elif opcode == "neg":
            variables[out_name] = apply_unary_operation(variables[args[0]], lambda a: -a)

        elif opcode == "square":
            variables[out_name] = apply_unary_operation(variables[args[0]], lambda a: a * a)

        elif opcode == "sqrt":
            # Avoid math domain errors for negative numbers
            variables[out_name] = apply_unary_operation(variables[args[0]], lambda a: math.sqrt(a) if a >= 0 else float("nan"))

        else:
            raise ValueError(f"Unknown opcode: {opcode}")

if last_variable_name is None:
    raise RuntimeError("The VM file contained no executable instructions.")

# ==========================
# Image Generation
# ==========================

output_array = variables[last_variable_name]

# Write the result to a PGM file (binary grayscale)
with open("output.pgm", "wb") as output_file:
    # P5 → Binary PGM header, followed by width, height, and max gray value (255)
    output_file.write(f"P5\n{IMAGE_SIZE} {IMAGE_SIZE}\n255\n".encode("ascii"))

    for i in range(IMAGE_SIZE):
        row_bytes = bytearray(IMAGE_SIZE)
        for j in range(IMAGE_SIZE):
            pixel_value = output_array[i][j]
            # Threshold: white (255) if value < 0, black (0) otherwise
            row_bytes[j] = 255 if (isinstance(pixel_value, float) and pixel_value < 0) else 0
        output_file.write(row_bytes)

print("✅ Image successfully written to 'output.pgm'")





# from https://www.mattkeeter.com/projects/prospero/

# import numpy as np

# with open('prospero.vm') as f:
#     text = f.read().strip()

# image_size = 1024
# space = np.linspace(-1, 1, image_size)
# (x, y) = np.meshgrid(space, -space)
# v = {}

# for line in text.split('\n'):
#     if line.startswith('#'):
#         continue
#     [out, op, *args] = line.split()
#     match op:
#         case "var-x": v[out] = x
#         case "var-y": v[out] = y
#         case "const": v[out] = float(args[0])
#         case "add": v[out] = v[args[0]] + v[args[1]]
#         case "sub": v[out] = v[args[0]] - v[args[1]]
#         case "mul": v[out] = v[args[0]] * v[args[1]]
#         case "max": v[out] = np.maximum(v[args[0]], v[args[1]])
#         case "min": v[out] = np.minimum(v[args[0]], v[args[1]])
#         case "neg": v[out] = -v[args[0]]
#         case "square": v[out] = v[args[0]] * v[args[0]]
#         case "sqrt": v[out] = np.sqrt(v[args[0]])
#         case _: raise Exception(f"unknown opcode '{op}'")
# out = v[out]

# with open('out.ppm', 'wb') as f: # write the image out
#     f.write(f'P5\n{image_size} {image_size}\n255\n'.encode())
#     f.write(((out < 0) * 255).astype(np.uint8).tobytes())


