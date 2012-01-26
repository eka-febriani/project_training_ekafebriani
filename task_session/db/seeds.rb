# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


users = User.create([{:first_name => 'Eka', :last_name =>'Febriani', :email =>'eka@yahoo.com', :username => 'ekafebriani'}, {:first_name => 'Andi', :last_name =>'Andriana', :email =>'andi@yahoo.com', :username => 'andiA'}, {:first_name => 'Lila', :last_name =>'Betty', :email =>'betty@yahoo.com', :username => 'betty'}, {:first_name => 'Jeni', :last_name =>'Janne', :email =>'jj@yahoo.com', :username => 'jenny'}, {:first_name => 'Topik', :last_name =>'Hidayat', :email =>'topik@yahoo.com', :username => 'topikH'}])

coutries = Country.create([{:code => 'INA', :name => 'Indonesia'},{:code => 'IND', :name => 'India'},{:code => 'MAL', :name => 'Malaysia'},{:code => 'USA', :name => 'United State'},{:code => 'ENG', :name => 'Inggris'}])

articles = Article.create([{:title => 'Indonesia Jaya', :body => 'apa kata mereka'},{:title => 'Teratai', :body => 'bunga kolam'},{:title => 'Serikat Dagang', :body => 'Sejarah serikat'},{:title => 'Terapi jaya', :body => 'macam-macam terapi'},{:title => 'Akupuntur', :body => 'dengan jarum'}])

comments = Comment.create ([{:content => 'aaaaa', :article_id => 5},{:content => 'bbbbb'},{:content => 'ccccc'},{:content => 'ddddd'},{:content => 'eeeee'}])
