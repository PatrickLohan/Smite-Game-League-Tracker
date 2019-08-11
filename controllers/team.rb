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

# DELETE
post '/teams/:id/delete' do
  id = params[:id].to_i
  team = Team.find(id)
  team.delete()
  redirect '/teams'
end

# EDIT
get '/teams/:id/edit' do
  id = params[:id].to_i()
  @team = Team.find(id)
  erb(:"teams/edit")
end

#UPDATE
post '/teams/:id' do
  team = Team.new(params)
  team.update()
  redirect '/teams'
end

# SHOW
get '/teams/:id' do
  id = params[:id].to_i()
  @team = Team.find(id)
  erb(:"teams/show")
end
