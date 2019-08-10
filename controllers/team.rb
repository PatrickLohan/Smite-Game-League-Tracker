require_relative('../models/team.rb')

# INDEX
get '/teams' do
  @teams = Team.all()
  erb(:"teams/index")
end

# NEW
get '/teams/new' do
  erb(:"teams/new")
end

# CREATE
post '/teams' do
  team = Team.new(params)
  team.save()
  redirect "/teams"
end
