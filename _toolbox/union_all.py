# Copy the Excel content to tab_file.txt
# Run the script - this will generate the union_all.SQL, with the union all to put all the values together
# In the tab_file.txt

cnt = 0
output = []
first_row_is_column_name = 0
dummy_col_name = 'col'

with open("tab_file.txt", encoding='utf8') as f: # open the file with utf8
    lines = f.readlines()
    # output.append("select * from (values") 
    startingLine = first_row_is_column_name  
    for line in lines[startingLine:]: 
        cnt += 1
        line = line.strip().replace("'", "''")
        arr = line.split('\t')
        curr = f"select {dummy_col_name} = '"
        for i, c in enumerate(arr):
            curr += arr[i] + "' " + ( f", {dummy_col_name} = '" if i < len(arr)-1 else "" )
        
        curr += r"union all" # add union all to each record,
        output.append(curr) 

if first_row_is_column_name == 1:  # to add column names to the first line
    titles = lines[0].strip().replace("'", "''").split('\t')
    for _ in range(len(output)): # going through each line in the output, and plug in the column name
        for i, title in enumerate(titles):
            output[_] = output[_].replace(f'{dummy_col_name}', title, 1) # each time, replace the first occurrence of the dummycol, this make sure all the column names will be updated

output[-1] = output[-1].replace("union all", "") #take out the final " union all "
with open("union_all.SQL", "w", encoding='utf8') as f:
     for o in output:
         f.write(o)
         f.write('\r')








