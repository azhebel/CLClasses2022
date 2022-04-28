#!/bin/bash

# Tokenize and count occurrences of each token

# Get the first n lines
#head -n 20 "$1" | \

# Replace line breaks with spaces
tr "\n" " " < "$1" | \

# Replace all XML tags with spaces
sed -e "s/<[^>]*>/ /g" | \

# Replace all non-alphabetic characters with newlines (tokenize)
tr -cs "[:alpha:]" "\n" | \

# Change everything to lowercase
tr "[:upper:]" "[:lower:]" | \

# Sort alphabetically, count unique occurrences, and sort by number of occurrences
sort | uniq -c | sort -nr

# Try: ./tkn.sh <(cat ../help-sources/intellij-platform/topics/*.xml) | head