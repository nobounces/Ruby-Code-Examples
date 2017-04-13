##Getting Started

*nobounce_email.rb* performs a single email verification process.

*nobounce_file.rb* uploads a .csv file for verification process.

**NOTE: You will need to edit scripts and insert API user & key.**

##Installation

Make sure you have these rubygems installed.

`$ gem install curb`

`$ gem install json `


##Usage

```ruby
require "curb"
require "json"

#Insert your API user and key
user =  "Your_API_User_Here"
key = "Your_API_Key_Here"
```


Example to send email `user@domain.co.zw` for verification.

`$ ruby nobounce_email.rb user@domain.co.zw`

Example to upload `team.csv` for verification.

`$ ruby nobounce_file.rb ./team.csv`
