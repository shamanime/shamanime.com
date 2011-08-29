# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'jefferson', :username => 'jefferson', :email => 'jefferson@shamanime.com', :password => '123456', :password_confirmation => '123456'
puts 'New user created: ' << user.name
post = Post.create! :title => 'First Post', :body => 'Nunc varius ultrices venenatis. Pellentesque vulputate blandit dolor vel pellentesque. Mauris porttitor elit sed diam feugiat ut adipiscing ante auctor. Cras est enim, aliquam id tempus sit amet, accumsan in sem. Duis mi mauris, porta ut adipiscing id, elementum nec urna. Maecenas nec velit ante. In facilisis tempor aliquet. Duis enim ligula, lobortis a laoreet non, lobortis id eros.', :published_on => Time.now, :user => user
puts 'New post created: ' << post.title