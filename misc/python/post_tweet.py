import tweepy

# Replace with your own credentials
consumer_key = 'xxx'
consumer_secret = 'xxx'

access_token = 'xxxxx'
access_token_secret = 'xxxxxxxxxxxx'

# Authenticate with Twitter
api = tweepy.Client(
access_token=access_token,
access_token_secret=access_token_secret,
consumer_key=consumer_key,
consumer_secret=consumer_secret)

# The text of your tweet
tweet = "replace the text here.... "

# Post the tweet
api.create_tweet(text=tweet)
# print(api.get_liked_tweets(id = 'theRenjie'))

