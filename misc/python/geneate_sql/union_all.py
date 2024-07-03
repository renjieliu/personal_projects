# Copy the Excel content to tab_file.txt
# Run the script - this will generate the union_all.SQL, with the union all to put all the values together
# In the values.SQL

cnt = 0
output = []
title = []
with open("tab_file.txt", encoding='utf8') as f: # open the file with utf8
    lines = f.readlines()
    # output.append("select * from (values")
    for line in lines:
        cnt += 1
        line = line.strip().replace("'", "''")
        arr = line.split('\t')
        curr = f"select '"
        for i, c in enumerate(arr):
            curr += arr[i] + "' ,'"
        curr = curr[:-2] + " \r union all" # take out the final ",'" and add ),
        output.append(curr) 

output[-1] = output[-1].replace("union all", "") #take out the final " union all "
with open("union_all.SQL", "w", encoding='utf8') as f:
     for o in output:
         f.write(o)
         f.write('\r')





