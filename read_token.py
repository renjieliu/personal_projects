#token file format
#domain_xxx: value.
#e.g. twitter_private_token: 1234567xxx

def getToken():
    dict = {}
    with open('token.txt', "r") as f:
        content = f.readlines()
        for r in content:
            r = r.strip()
            if r:
                arr = r.strip().split(":")
                if arr:
                    k = arr[0].strip()
                    v = arr[1].strip()
                    dict[k] = v
    return dict

getToken()
