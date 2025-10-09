import json 

with open("chappaqua_weather_temperature_19400101_20251009.txt") as f: 
    base = json.load(f)


# time
# temperature_2m


base = dict(base)
for k, v in base.items():
    if k=="hourly": 
        data = dict(v)
        for dk, dv in data.items():
            for i in range(len(data["time"])):
                if "2025-06" in data["time"][i]:
                    print (data["time"][i], data["temperature_2m"][i])
        



