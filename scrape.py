import requests
from bs4 import BeautifulSoup

# URL of the webpage to scrape
url = 'https://www.un.org/sg/en/content/senior-management-group'  # Replace with your target URL

# Set up headers to simulate a browser request
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36'
}

# Send a GET request with headers
response = requests.get(url, headers=headers)
response.raise_for_status()  # Check if the request was successful

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.text, 'html.parser')

# Extract information within the "well" class container
people_data = []
for well in soup.select('.well'):
    # Extract name with hyperlink from "smg-link text-center"
    name_tag = well.select_one('.smg-link.text-center a')
    #print(name_tag)
    if name_tag:
        name = name_tag.get_text(strip=True)
        name_link = name_tag.get('href')
        #print("name link", name_link)
        name_link = f"https://www.un.org/{name_link}" if name_link else "#"  # Complete the relative URL if present

    # Extract the title from "smg-title text-center"
    title_tag = well.select_one('.smg-title.text-center')
    title = title_tag.get_text(strip=True) if title_tag else "N/A"
    
    # Append name with hyperlink and title as a tuple to people_data
    people_data.append((f"[{name}]({name_link})", title))

# Create Markdown table output
markdown_table = "| Name | Title |\n| --- | --- |\n"
for name, title in people_data:
    markdown_table += f"| {name} | {title} |\n"

# Print or save the result
print(markdown_table)

# If you want to save the output to a file
with open("output.md", "w") as file:
    file.write(markdown_table)
