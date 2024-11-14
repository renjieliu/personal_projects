local = set()
cloud = set()
with open("local.txt", encoding='UTF-8') as f: 
    for line in f:
        curr = line.split('\\')[-1]
        local.add(curr)

with open("output_google_photos.txt", encoding='UTF-8') as f:
    cloud = set(f.readlines())

print(local - cloud)
