#!/bin/zsh

# Start witht the empty results file
cat /dev/null > result_numbers.txt 

# Read a phone number from a file 
INPUT=incoming_numbers.csv
#IFS='\t'
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while IFS=',' read -r phoneNumber smsUrl voiceUrl friendlyName
do
#	echo "phone number: $phoneNumber"
#	echo "SMS: $smsUrl"
#	echo "Voice: $voiceUrl"
#	echo "friendly: $friendlyName"

	# Fetch the new Phone number SID 
	pnSID=`twilio api:core:incoming-phone-numbers:list --phone-number=$phoneNumber -o tsv --properties='sid' --no-header`
#	echo "sid: $pnSID"

	# Update the incoming phone number SMS and Voice URL 
	twilio api:core:incoming-phone-numbers:update --sid=$pnSID --sms-url=$smsUrl --voice-url=$voiceUrl -o tsv | tail -1 >> result_numbers.txt

	echo -ne "#"
done <$INPUT
echo "\n All numbers are updated. Please check result_numbers.txt file"
