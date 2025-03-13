#1. Copy the weread notes to the weReadNotes.txt
#2. Get the flomo api, to put into the .env file
#3. Replace the bookName, tag variable with the author and bookName
#4. Run this script, it outputs a command to run in Linux
#5. Execute the command, which should publish all the notes to flomo

#6. ENHANCEMENT!! - the curl command will be executed autimatically, no need to execute the bash file




from dotenv import load_dotenv
import os

import subprocess 
import platform


env = load_dotenv(".env") #this is to load all the environment variables
api=os.getenv("FLOMO_API")
note_placeholder = "@@"
flomo_api = r'''curl -X POST FLOMOAPI -H "Content-type: application/json" -d '{"content": "PLACEHOLDER" }' '''.replace("FLOMOAPI", api).replace("PLACEHOLDER", note_placeholder)
weReadNotes = []
command = []

left_angle_bracket = "&lt;" # flomo will treat < and > as html tags, so using the literal html code
right_angle_bracket = "&gt;"

bookName = rf"蔡崇達 - {left_angle_bracket}皮囊{right_angle_bracket}"  # this is to be replaced for each book, and 
tag = "#readwise"

with open("weReadNotes.txt", encoding="utf-8") as f:
    for line in f:
        if line[0] == "◆":
            note = line[2:].strip("\r\n").replace("'", r"'\''")
            note = rf"{tag} \n" + note + " -- " + bookName
            commandTxt = flomo_api.replace(note_placeholder, note)
            command.append(commandTxt)

            # print('Posting onto flomo.... ')

            # if platform.system() == "Windows":
            #     output = subprocess.run(['cmd.exe', '/c', commandTxt], capture_output = True, text = True)
            #     print(output.stdout)
            # else:
            #     output = subprocess.run(['bash', commandTxt], capture_output = True, text = True)
            #     print(output.stdout)


with open("weReadNoteCommand.sh", "w", encoding="utf-8") as f:
    f.write("#!/bin/bash\n")
    for c in command:
        f.write(c) 
        f.write("\n")




