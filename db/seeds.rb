# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by(name: role)
  puts 'role: ' << role
end

html_content = ContentType.create(:name => 'HTML')

# DEFAULT THEME
theme = Theme.create(:name => 'Default')

# TEST ONE
pres = Presentation.create(:name => 'What is Twalk?', :description => "An in-depth explanation of Twalk.")
Slide.create(:sort_order => 1, :theme => theme, :presentation => pres)
Slide.create(:sort_order => 2, :theme => theme, :presentation => pres)

pres.slides.each do |slide|
	slide.contents << Content.create(:body => '<img src="http://lorempixel.com/600/300/" />', :sort_order => 1, :content_type => html_content)
	slide.contents << Content.create(:body => '<h1>Lorem Ipsum Sit Amet Dolor</h1>', :sort_order => 2, :content_type => html_content)
end

# TEST TWO
pres = Presentation.create(:name => 'How to drive a stickshift', :description => "Learn how to drive a stickshift today!")
Slide.create(:sort_order => 1, :theme => theme, :presentation => pres)
Slide.create(:sort_order => 2, :theme => theme, :presentation => pres)

pres.slides.each do |slide|
	slide.contents << Content.create(:body => '<img src="http://lorempixel.com/600/300/" />', :sort_order => 1, :content_type => html_content)
end