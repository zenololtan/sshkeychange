def intra_login(url)
	agent = Mechanize.new
	page = agent.get(url)
	form = page.forms.first

	puts "Logging in."
	form.field_with(:id => "user_login").value = "login"
	form.field_with(:id => "user_password").value = "pwd"

	form.submit
	agent
end
