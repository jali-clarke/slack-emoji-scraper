# slack-emoji-scraper

yup

## dependencies

`python -m pip install -r requirements.txt`

## how to run

make sure you have your slack token set via the `SLACK_TOKEN` env var.  then, do `python scrape-emojis.py` and it will create a directory with files named after their emoji triggers, ignoring aliased emojis.  e.g. if your emoji is triggered via `:cool:`, it will be saved as a file named `cool.<ext>`.

all aliases will be put into `alias_map.json` within the same generated directory
