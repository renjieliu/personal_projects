
# RL -- 20230312_114432: This was trying to read Robinhood statement PDF file, and convert the activities to an Excel.
# The process does NOT work, as the table header and content cannot be recognized correctly.
# In order to run the script, Java Runtime Environment(JRE) needs to be installed
# 

import PyPDF2 as pp
import tabula

pdf = r"\path_to\xxx.pdf"
outputExcel = r"\path_to\xxx.xlsx"
outputcsv = r"\path_to\xxx.csv"
reader = pp.PdfReader(pdf)
number_of_pages = len(reader.pages)
page = reader.pages[0]
text = page.extract_text()
print(text)




# readinf the PDF file that contain Table Data
# you can find find the pdf file with complete code in below
# read_pdf will save the pdf table into Pandas Dataframe
df = tabula.read_pdf(pdf,multiple_tables=True, pages="all")
# in order to print first 5 lines of Table
print(df)
#df.head()
# tabula.convert_into(pdf,  outputExcel, output_format="xlsx")
tabula.convert_into(pdf, outputcsv, output_format="csv", pages='all')


