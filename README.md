# slack-emoji-scraper

yup

make sure you have your slack token set via the SLACK_TOKEN env var.  then, do `python scrape-emojis.py` and it will create a directory with files named after their emoji triggers, ignoring aliased emojis for now.  e.g. if your emoji is triggered via `:cool:`, it will be saved as a file named `cool.<ext>`.
