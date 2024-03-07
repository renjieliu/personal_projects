# Copy the Excel content to tab_file.txt
# first column is the target set column
# Run the script - this will generate the where.SQL, concatenate all the columns, adding double quotes
# In the where.sql, remember to replace the XXX placeholder

cnt = 0
output = []
title = []
with open("tab_file.txt", encoding='utf8') as f: # open the file with utf8
    lines = f.readlines()
    for line in lines:
        line = line.strip().replace("'", "''")
        cnt += 1
        if cnt == 1:
            title = line.split('\t')
        else:
            arr = line.split('\t')
            curr = f"update XXX set {title[0]} = '{arr[0]}' where "
            for i, c in enumerate(arr):
                if i > 0: 
                    curr +=  title[i] + "='" + arr[i] + "' and "
            output.append(curr[:-4]) # take out the final "and "
 
with open("where.SQL", "w", encoding='utf8') as f:
     for o in output:
         f.write(o)
         f.write('\r')





