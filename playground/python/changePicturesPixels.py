from PIL import Image

im = Image.open(r"C:\Users\lrjthinkpad\Desktop\1.jpg")
pixelMap = im.load()

limit = 190

for i in range(im.size[0]):
    for j in range(im.size[1]):
        color = pixelMap[i, j]
        gray = (color[0] + color[1] + color[2] )//3
        if gray >= limit:
            pixelMap[i, j] = (255,255,255)
        else:
            pixelMap[i, j] = (0, 0, 0)
        # elif gray <lower:
        #     pixelMap[i, j] = (0,0,0)
        # else:
        #     pixelMap[i, j] = (gray, gray, gray)


im.save(r"C:\Users\lrjthinkpad\Desktop\1_1.bmp")
