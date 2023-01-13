#!/bin/zsh

# Fetch all incoming phone numbers using the Twilio CLI
twilio api:core:incoming-phone-numbers:list --properties 'phoneNumber,smsUrl,voiceUrl,friendlyName' -o tsv --no-header --no-limit > incoming_numbers.txt

# Convert the file to a csv
sed 's/'$'\t''/,/g' incoming_numbers.txt > incoming_numbers.csv

# null out the incoming.txt file
cat /dev/null > incoming_numbers.txt

echo "File with all phone number is downloaded to incoming_numbers.csv"
