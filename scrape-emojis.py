import json
import os
import requests
import slack
import time

slack_token = os.environ["SLACK_TOKEN"]
client = slack.WebClient(token=slack_token)

response = client.emoji_list()

if not response["ok"]:
    raise RuntimeError("fetch failed")

all_emoji = response["emoji"]

aliases = {}
emojis = {}

for key, value in response["emoji"].items():
    if value.startswith("alias:"):
        aliases[key] = value.split(':')[1]
    else:
        emojis[key] = value

output_dir = f"output/{str(time.time())}"
os.makedirs(output_dir, exist_ok=True)

alias_map_filename = f"{output_dir}/alias_map.json"
with open(alias_map_filename, "w") as alias_map:
    json.dump(aliases, alias_map)

print(f"wrote alias map to {alias_map_filename}")

for emoji_name, emoji_url in emojis.items():
    output_filename = f"{output_dir}/{emoji_name}.{emoji_url.split('.')[-1]}"
    with open(output_filename, "wb") as emoji_file:
        emoji_response = requests.get(emoji_url, allow_redirects=True)
        emoji_file.write(emoji_response.content)

    print(f"saved {emoji_url} to {output_filename}")