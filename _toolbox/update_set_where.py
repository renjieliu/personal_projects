# Copy the Excel content to tab_file.txt
# first columns are the target set column
# separate the set columns and where columns with a column filled with `
# Run the script - this will generate the where.SQL, concatenate all the columns, adding double quotes
# In the where.sql, remember to replace the XXX placeholder

cnt = 0
output = []
set_cols = []
set_values = []
where_cols = []
where_values =[]
tableName = 'Gratis_2022_2023_wk' # change the table name here, or in the final output file

with open("tab_file.txt", encoding='utf8') as f: # open the file with utf8
    lines = f.readlines()
    for line in lines:
        line = line.strip().replace("'", "''")
        cnt += 1
        if cnt == 1:
            set_cols = line.split('`')[0].strip().split('\t') #split the target column and where columns
            where_cols = line.split('`')[1].strip().split('\t')
        else:
            set_values = line.split('`')[0].strip().split('\t')
            where_values = line.split('`')[1].strip().split('\t')

            curr = f'update {tableName} set '
            for i, c in enumerate(set_values):
                curr += ("" if i == 0 else " , ") + set_cols[i] + "='" + set_values[i] + "'" 

            curr += " where "

            for i, c in enumerate(where_values):
                curr += where_cols[i] + " = '" + where_values[i] + "' and "
            output.append(curr[:-4]) # take out the final "and "


with open("update_set_where.SQL", "w", encoding='utf8') as f:
     for o in output:
         f.write(o)
         f.write('\r')





