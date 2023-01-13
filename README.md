# bulk_phonenumber_configuration
Download Twilio numbers list from one account and update to another account
1. Install Twilio CLI using instruction https://www.twilio.com/docs/twilio-cli/quickstart
2. Login to your existing Twilio Account https://www.twilio.com/docs/twilio-cli/general-usage/profiles
3. Set read write permission to download_phone_number_configuration.zsh and update_incoming_phone_number_url.zsh files.  
	chmod 770 update_incoming_phone_number_url.zsh  
	chmod 770 download_phone_number_configuration.zsh
4. execute the download_phone_number_configuration.zsh file. 
	./download_phone_number_configuration.zsh
5. This will create a csv file in your local environment
6. Once the numbers are transferred to new account by support then run the following instructions.
7. Change your Twilio CLI to point to new Twilio account 
8. Change the Twilio CLI profile https://www.twilio.com/docs/twilio-cli/general-usage/profiles
9. excecure the update_incoming_phone_number_url.zsh to update phone number configurations.  
	This script is going to update the phone numbers voiceUrl and SmsUrl properties   
	./update_incoming_phone_number_url.zsh  
10. Once complete check the result file to make sure all numbers are updated  
