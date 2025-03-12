import dotenv
import os
from openai import OpenAI

# Replace with your OpenAI API key
dotenv.load_dotenv(".env")
key = os.getenv("API_KEY")

client = OpenAI(api_key=key)

system_prompt = '''
def insideFunc():
    return "Hello! this is from the inside function"

def outsideFunc():
    pic = "To generate a picture with all the basketball in the sky"
    return pic
'''

completion = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": system_prompt},
        {
            "role": "user",
            "content": "insideFunc()"
        }
    ]
)

print(completion.choices[0].message)


