require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'dotenv/load'

require_relative 'scraping.rb'

input = ARGV

key1 = ""

key2 = ""

key3 = ""

if input[1] == ""
	key = key1
elsif input[1] == ""
		key = key2
elsif input[1] == ""
		key = key3
else
	abort "Error, did not recognize which key to use."
end
url = "https://profile.intra.42.fr/gitlab_users/new"

agent = intra_login("https://profile.intra.42.fr/")

page = agent.get url

doc = Nokogiri::HTML(page.content.toutf8)
if doc.title != "Intra Profile Gitlab New"
	abort "Error, failed to log in."
else
	puts "Successfull login."
end
ssh_form = page.forms[1]

ssh_form.field_with(:id => "gitlab_user_public_key").value = key

ssh_form.submit

puts "Updated ssh key."
