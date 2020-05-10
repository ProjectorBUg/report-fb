require 'rubygems'
require 'mechanize'
require 'colorize'
require 'optparse'
require 'highline/import'

options = {}

puts "#{'┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓'.yellow}"
puts "#{'┃'.yellow} #{'     RUBY FACEBOOK AUTO-REPORTER'.red}""#{'     ┃'.yellow}"
puts "#{'┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'.yellow}"
puts "#{'┃'.yellow} #{'Created By:'.yellow} #{'Pace USA'.green}""#{'  ┃'.yellow}"
puts "#{'┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'.yellow}"
puts "#{'┃'.yellow} #{'Github :'.blue} #{'https://github.com/ProjectorBUg'.blue}""#{'┃'.yellow}"
puts "#{'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛'.yellow}"
puts ''
class Facebook < Mechanize
	user_agent_alias = 'Windows Mozilla'
	follow_meta_refresh = true

	def login(email, pass)
# FREE FACEBOOK MODE
		get 'https://free.facebook.com/'

# MOBILE FACEBOOK MODE
		#get 'https://www.m.facebook.com/'
		form_login = page.form_with(:method => 'POST') do |a|
			a.email = email
			a.pass = pass
		end.submit(form_login)
		pp form_login
	end

	def report_someone(ent)
# FREE FACEBOOK MODE
		get "https://free.facebook.com/nfx/basic/question/?context_str={%22initial_action_name%22%3A%22RESOLVE_PROBLEM%22%2C%22breadcrumbs%22%3A[]%2C%22story_location%22%3A%22profile_someone_else%22%2C%22is_from_feed_tombstone%22%3Afalse%2C%22actions_taken%22%3A%22%22%2C%22is_rapid_reporting%22%3Afalse%2C%22reportable_ent_token%22%3A%22#{ent}%22%2C%22is_impostor%22%3A%22%22}&redirect_uri=%2Fprofile.php%3Fid%3D#{ent}" do |a|

# MOBILE FACEBOOK MODE
		#get "https://m.facebook.com/nfx/basic/question/?context_str={%22initial_action_name%22%3A%22RESOLVE_PROBLEM%22%2C%22breadcrumbs%22%3A[]%2C%22story_location%22%3A%22profile_someone_else%22%2C%22is_from_feed_tombstone%22%3Afalse%2C%22actions_taken%22%3A%22%22%2C%22is_rapid_reporting%22%3Afalse%2C%22reportable_ent_token%22%3A%22#{ent}%22%2C%22is_impostor%22%3A%22%22}&redirect_uri=%2Fprofile.php%3Fid%3D#{ent}" do |a|
			b = page.forms.first do |a|
				a['a'] = 'b'
			end
			c = b.radiobutton_with(:value => /account/).check
			d = a.form_with(:method => 'POST') do |a|
				puts 'SEGMENT REPORT 1 SUBMITTED'
			end.submit(d)
		end
		e = page.forms.first do |a|
			a['a'] = 'b'
		end
		f = e.radiobutton_with(:value => /fake/).check
		g = page.form_with(:method => 'POST') do |a|
			puts 'SEGMENT REPORT 2 SUBMITTED'
		end.submit(g)
		h = page.forms.first do |a|
			a['a'] = 'b'
		end
		i = h.radiobutton_with(:value => /REPORT_CONTENT/).check
		j = page.form_with(:method => 'POST') do |a|
			puts 'REVIEW TO FACEBOOK'
		end.submit(j)
	end
end

facebook = Facebook.new

parser = OptionParser.new do |opts|
	opts.banner = ' USAGE: ruby report-fb.rb [options]'
	opts.on('-l', '-L', '--LOGIN', '--login', 'LOGIN INTO FACEBOOK') do |l|
		options[:login] = l
	end

	opts.on('-p', '-P', '--PERSON', '--person', 'REPORT ACCOUNT') do |p|
		options[:person] = p
	end

	opts.on('-h', '-H', '--HELP', '--help', 'SHOW HELP/USAGE MESSAGE') do
		puts opts
		puts ''
		puts "#{'┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓'.red}"
		puts "#{'┃'.red}#{' USAGE: ruby report-fb.rb -l -L --login --LOGIN'.blue}                 #{' ┃'.red}"
		puts "#{'┃'.red}#{'┌────────────────────────────────────┐'.green}""#{'                           ┃'.red}"
		puts "#{'┃'.red}#{'│ Example : ruby report-fb.rb --login│'.green}""#{'                           ┃'.red}"
		puts "#{'┃'.red}#{'└────────────────────────────────────┘'.green}""#{'                           ┃'.red}"
		puts "#{'┃'.red}#{' USAGE: ruby report-fb.rb -p -P --person --PERSON 100040832567374'.blue}#{'┃'.red}"
		puts "#{'┃'.red}#{'┌─────────────────────────────────────────────────────────┐'.green}""#{'      ┃'.red}"
		puts "#{'┃'.red}#{'│ Example : ruby report-fb.rb --person "target_profile_id"│'.green}""#{'      ┃'.red}"
		puts "#{'┃'.red}#{'└─────────────────────────────────────────────────────────┘'.green}""#{'      ┃'.red}"
		puts "#{'┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛'.red}"
		puts ''
		exit
	end

end

parser.parse!

if options[:login]
	puts ''
	puts "#{' LOGIN INTO FACEBOOK'.green}"
	usr = ask(" USERNAME:  ") { |a| a.echo = true}
	pwd = ask(" PASSWORD:  ") { |a| a.echo = "*" }
	facebook.login(usr, pwd)
end

if options[:person]
	facebook.report_someone(ARGV[2])
end
