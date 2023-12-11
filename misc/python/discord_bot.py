import discord
from discord.ext import commands


# Define the intents
intents = discord.Intents.default()
intents.messages = True

# Create a bot instance
bot = commands.Bot(command_prefix='!', intents=intents)

# Event listener for when the bot is ready
@bot.event
async def on_ready():
    print(f'Logged in as {bot.user.name}')

# Command to respond to "Ping"
@bot.command(name='Ping')
async def ping(ctx):
    await ctx.send('Pong')


bot.run('my_discord_token_here')

