# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
  { name: 'Demo User', email:'demo@yuxiglobal.com', password: "demo1234", password_confirmation: "demo1234" }
])

Article.create!([
  { title: 'Demo title article', description:'Demo description article', body: "Demo body article", user_id: User.find_by_name('Demo User').id }
])

Comment.create!([
  { description: 'Demo description comment', article_id: Article.find_by_title('Demo title article').id, user_id: User.find_by_name('Demo User').id }
])

Category.create!([
  { title: 'Rails'},
  { title: 'Angular'}
])