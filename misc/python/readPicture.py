from PIL import Image

def get_image_rgb_values(image_path):
    # Open the image file
    with Image.open(image_path) as img:
        # Convert image to RGB (in case it's a different format)
        rgb_image = img.convert('RGB')

        # Initialize a list to store RGB values
        rgb_values = set()

        # Loop through each pixel
        for y in range(rgb_image.height):
            for x in range(rgb_image.width):
                # Get RGB values of the pixel
                r, g, b = rgb_image.getpixel((x, y))
                # Append the RGB values to the list
                rgb_values.add((r, g, b))
        
        return rgb_values

# Example usage
image_path = r"path_here"
rgb_values = get_image_rgb_values(image_path)

print(len(rgb_values))




