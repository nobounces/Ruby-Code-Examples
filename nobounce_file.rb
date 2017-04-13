require 'curb'
require 'json'

#This script interacts with the NobounceIO API for upload of file.csv for verification

#Insert your API user and key
user =  "Your_API_User_Here"
key = "Your_API_Key_Here"

#File to be uploaded ./file.csv
file = ARGV[0].chomp

#Post CURL input to API
response = Curl::Easy.new("https://api.nobounces.io")
response.multipart_form_post = true
response.http_post(
Curl::PostField.content('api_user', "#{user}"),
Curl::PostField.content('api_key', "#{key}"),
Curl::PostField.content('type', "upload"),
Curl::PostField.file('file', file)
)

#Extraction of information from JSON output
response = JSON.parse(response.body_str)
response.each do |a|
  $jobstatus = a[1]['Job_Status']
  $jobid = a[1]['Job_id']
end

#User Feedback
puts ":) #{file} has been #{$jobstatus} with Job_id #{$jobid}"
