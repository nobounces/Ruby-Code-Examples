require 'curb'
require 'json'

#This script interacts with the NobounceIO API for a single email verification

#API user and key
user =  "Your_API_User_Here"
key = "Your_API_Key_Here"

#Email to be verified username@domain
email = ARGV[0].chomp

#Post CURL input to API
response = Curl::Easy.http_post("https://api.nobounces.io",
    Curl::PostField.content('api_user', "#{user}"),
    Curl::PostField.content('api_key', "#{key}"),
    Curl::PostField.content('type', "single"),
    Curl::PostField.content('email', "#{email}")
    )

#Extraction of information from JSON output
response = JSON.parse(response.body_str)
response.each do |a|
  $email = a[1]['email']
  $valid = a[1]['isValid']
  $reason = a[1]['failedValidation']
end

#User Feedback
if $reason
    puts ":( #{$email} is #{$valid} because #{$reason}"
else
    puts ":) #{$email} is #{$valid}"
end
