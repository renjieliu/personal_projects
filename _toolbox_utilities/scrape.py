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

    if name_tag:
        name = name_tag.get_text(strip=True)
        name_link = name_tag.get('href')
        #print("name link", name_link)
        name_link = f"https://www.un.org/{name_link}" if name_link else "#"  # Complete the relative URL if present

    # Extract the title from "smg-title text-center"
    title_tag = well.select_one('.smg-title.text-center')
    title = title_tag.get_text(strip=True) if title_tag else "N/A"
    
    # Append name with hyperlink and title as a tuple to people_data
    people_data.append((name, name_link, title))

# Create HTML table output
html_table = "<table>\n<tr><th>Name</th><th>Title</th></tr>\n"
for name, link, title in people_data:
    html_table += f'<tr><td><a href="{link}">{name}</a></td><td>{title}</td></tr>\n'
html_table += "</table>"

# Print or save the result
print(html_table)

# If you want to save the output to a file
with open("output.html", "w") as file:
    file.write(html_table)


