require 'open-uri'

puts 'CREATING GENERIC TWALK USER'
# ================================================================================
twalk_user = User.find_or_create_by(name: 'twalk user',
            email: 'user@twalk.io',
            nickname: 'twalk',
            slug: 'twalk')

twalk_user.image = open 'https://api.adorable.io/avatars/face/eyes1/nose8/mouth5/f1f1f1'
twalk_user.save


puts 'ROLES'
# ================================================================================
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by(name: role)
  puts 'role: ' << role
end


puts 'CONTENT TYPES'
# ================================================================================
html_content = ContentType.find_or_create_by(:name => 'HTML')
image = ContentType.find_or_create_by(:name => 'image')


puts 'THEMES'
# ================================================================================
theme = Theme.find_or_create_by(:name => 'Default')
themes = %w{beige blood moon night serif simple sky solarized eighteeneff}
themes.each {|t| Theme.find_or_create_by(name: t.titleize) }
