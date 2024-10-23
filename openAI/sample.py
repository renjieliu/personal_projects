import dotenv
import os
from openai import OpenAI

# Replace with your OpenAI API key
dotenv.load_dotenv(".env")
key = os.getenv("API_KEY")

client = OpenAI(api_key=key)

completion = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {
            "role": "user",
            "content": "what is the date today?"
        }
    ]
)

print(completion.choices[0].message)

