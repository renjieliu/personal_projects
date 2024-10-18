from wordpress_xmlrpc import Client, WordPressPost
from wordpress_xmlrpc.compat import xmlrpc_client
from wordpress_xmlrpc.methods import media, posts
import mammoth

with open("./Testing publish with Google docs plugin.docx", "rb") as docx_file:
    result = mammoth.convert_to_html(docx_file)
    html = result.value # The generated HTML
    messages = result.messages # Any messages, such as warnings during conversion



# Replace with your WordPress site details
url = 'http://xxx.xx/xmlrpc.php'
username = 'xxxx'
password = 'xxxx'

# Create a client instance
client = Client(url, username, password)

# Create a new post with HTML content
post = WordPressPost()
post.title = 'The real deal 5'
post.content = html
post.post_status = 'publish'

# Publish the post
post_id = client.call(posts.NewPost(post))

print(f'Post published with ID: {post_id}')

