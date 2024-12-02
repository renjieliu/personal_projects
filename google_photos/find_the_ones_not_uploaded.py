local = set()
cloud = set()
with open("local.txt", encoding='UTF-8') as f: 
    for line in f:
        curr = line.strip('"').split('\\')[-1] # take out the double quote at the start and end of the path
        local.add(curr)

with open("output_google_photos.txt", encoding='UTF-8') as f:
    cloud = set(f.readlines())

print(local - cloud)
