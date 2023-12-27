import tweepy

# Twitter API credentials
consumer_key = 'swpfVZxDac9cQ6dA25RkTOMgK'
consumer_secret = 'eYVApxEDCUrYnPr9mMKloWj1UYxcmz5ItH1T4oUCk1CqV5lbzL'
access_token = '1383624499-npn0Nm5G1jxABbtKsY42MHR8PwRwk2FumAK24gN'
access_token_secret = 'QGdzSgi0Nz5tyXlgAIr5x97Mi7leBhGqWjZmN0fpXnPsN'
bearer_token = 'AAAAAAAAAAAAAAAAAAAAALFHgAEAAAAA19w9LlzFcf9ILUYbyMk%2FqXahXn4%3DN6sHkCKuJoUPVw3YJt6BrfoeoznzWH7Fu27T3N4Ip2uqImNPrP'


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

