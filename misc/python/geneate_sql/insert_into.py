# To check which column is getting truncated with insert into xxx select xxx from 
# This will generate the insert for each column

# Copy the column header as one line in the Excel
# Copy the Excel content to tab_file.txt
# Run the script - this will generate the insert_into.SQL
# In the insert_into.SQL


src_table = '#staging'
tgt_table = 'SWPS_DATA.GRC.UNV_Final'

output = []
title = []
with open("tab_file.txt", encoding='utf8') as f: # open the file with utf8
    arr = f.readline().strip().replace("'", "''").split('\t')
    for i, c in enumerate(arr):
        curr = f"insert into {src_table}([{c}]) select [{c}] from {src_table}"
        output.append(curr) 

with open("insert_into.SQL", "w", encoding='utf8') as f:
     for o in output:
         f.write(o)
         f.write('\r')




