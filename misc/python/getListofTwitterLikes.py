import tweepy

# Twitter API credentials
consumer_key = 'xxxx'
consumer_secret = 'xxxx'
access_token = 'xxxxx'
access_token_secret = 'xxxx'
bearer_token = 'xxxxx'


# Authenticate using Tweepy
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
#client = tweepy.Client(auth)

client = tweepy.Client(bearer_token)

# Screen name of the user whose likes you want to retrieve
target_user_screen_name = 'theRenjie'

# Get likes (favorites) for the specified user
likes = client.get_liked_tweets(id=target_user_screen_name, max_results=20)  # You can adjust the count as needed

# Print or process the likes
for like in likes:
    print(f"Tweet ID: {like.id}, Tweet Text: {like.text}")

