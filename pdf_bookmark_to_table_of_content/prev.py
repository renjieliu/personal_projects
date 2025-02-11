'''
Steps - 
0. Get below files in the directory
    - input.pdf - this is the main pdf to extract bookmarks from
    - addtional.pdf - this is the pdf file to append to the end of the main pdf

1. Get the main pdf file with bookmarks (toc)
    1.1 Insert other pdf as needed
2. Draw the ToC entry
    2.1 Break into multiple lines if needed
3. Find the position to draw page number
4. Draw a link rectangle on top of the ToC Entry, also need to cover the page number
5. Draw the page number on the right down corner of the ToC 
6. Adjust the bookmark location with the total number of ToC pages
7. Save the file.

'''

# TODO 
# 1. To understand each part and reduce hard code 
# 2. create functions for each step 
# 3. split into different modules


import fitz 
import os

# from reportlab.pdfgen import canvas
# from reportlab.lib.pagesizes import letter

# PDF unit is point, not pixel


print("Current working directory:", os.getcwd())




print('Generating Table of Content....')

#### Letter size paper ###
# paper_width = 612
# paper_height = 792

paper_size = "Letter" # full list can be found here - https://pymupdf.readthedocs.io/en/latest/functions.html#paper_size
fitz.paper_size(paper_size)

paper_width = fitz.paper_rect(paper_size)[2]
paper_height= fitz.paper_rect(paper_size)[3]

#### horizontal margin and vertical margin ####
x_margin = 50
y_margin = 50 

### ToC font size and line space ###
font_size = 9
line_space_size = 9 

toc_label_width = 512

link_width = paper_width - x_margin

pdf_main = fitz.open("input.pdf")
pdf_add = fitz.open("additional.pdf")

output_file = "output.pdf"

toc = pdf_main.get_toc(False) 
# print(toc)
content_page = len(pdf_main)

additional_toc = "Abbreviation Index For Represented Nationalities"

### add additioanl pdf to the end 

pdf_main.insert_pdf(pdf_add)

# add an entry to the bookmark for the additional abbrev
toc.append( [2, additional_toc, content_page+1, {'kind': 1, 'page': content_page+1, 'to': fitz.Point(0.0, 0.0), 'zoom': 0.0}] ) 

pdf_main.set_toc(toc)

toc_page_idx = 1
pdf_main.insert_page(toc_page_idx, width=paper_width, height=paper_height)
toc_page = pdf_main[toc_page_idx] 


toc_page.clean_contents()
toc_header = "Table of Contents"
toc_page.insert_text((x_margin, y_margin), toc_header, fontsize=20) # this is to insert the "Table of Contents" header

x = x_margin
y = y_margin

y += font_size * 2 # put 2 line between table of contents header and main ToC 

maxPageNum = toc[-1][2]

toc_start_entry = 1 # adjust as needed 

for level, title, pagenum, complex_stuff in toc[toc_start_entry:]: 
    y += font_size 
    toc_page.clean_contents() # clear the cache
    f = fitz.Font()

    ############################ For Entries ############################
    # to break the title into different lines, in case it's too long to fit into one line
    lines = []
    line = []
    words = title.split(' ') 
    while words:
        line.append(words.pop(0))
        if f.text_length(' '.join(line)) > toc_label_width:
            words.insert(0, line.pop())  # Put the last word back
            lines.append(' '.join(line))
            line = []

    # Add the last line
    if line:
        lines.append(' '.join(line))
    
    line_cnt = len(lines)
    
    if y + line_cnt * line_space_size >= paper_height - font_size * 8: # if current page cannot hold the entire ToC 
        toc_page_idx += 1
        pdf_main.insert_page(toc_page_idx, width=paper_width, height=paper_height)
        toc_page = pdf_main[toc_page_idx]
        y = y_margin

    # insert toc_title to the pdf doc 
    while lines:
        toc_page.clean_contents()
        toc_page.insert_text( (x, y),  lines.pop(0) , fontsize=font_size) #, fontname="Courier")
        y += line_space_size # Adjust line spacing as needed

    ####################################################################################
        

    # insert page number
    
    y -= line_space_size # to insert the page number at the same y as the ToC label
    digit = len(str(maxPageNum)) - len(str(pagenum)) # how many digit to shift
    magic_space = 1.2 # to align the page number to the right
    toc_page.insert_text( (paper_width - x_margin + (f.text_length('0', font_size)-magic_space )*digit , y), str(pagenum-1) , fontsize=font_size) #, fontname="Courier")
  

    # insert clickable rectangle
    from_y = y - line_space_size * line_cnt+1
    to_y = y

    link_rect = fitz.Rect( x, from_y, paper_width - x_margin//2, to_y )
    link_dict = {"kind": fitz.LINK_GOTO, "page": pagenum+toc_page_idx-1, "from": link_rect, "to": complex_stuff["to"]}
    toc_page.insert_link(link_dict) 

    y += line_space_size # add line spaces
    
    
    # insert page number for the ToC
    roman = {1: "i", 2: "ii", 3: "iii", 4: "iv", 5: "v", 6: "vi"}
    toc_page.clean_contents() # clear the cache
    toc_page.insert_text( ( paper_width-x_margin, paper_height-y_margin  ), roman[toc_page_idx], fontsize=font_size)

 
for t in toc:
    t[0] = 1 #set all the toc as level = 1, as needed
    t[2] += toc_page_idx


pdf_main.set_toc(toc[1:]) # as needed, take out the root level generated by Crystal Report

pdf_main.save(output_file) # save the merged document with a new filename

print(f'Done.. Check {output_file}')

###################### create a new pdf with only toc ###################### 

# print(pdf_main.page_count)
# pdf_main.delete_pages(from_page = 6, to_page=pdf_main.page_count-1)

# pdf_main.save("newpdf.pdf")

