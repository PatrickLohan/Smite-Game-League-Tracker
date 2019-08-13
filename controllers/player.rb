require_relative('../models/player.rb')

# INDEX
get '/players' do
  @players = Player.all()
  erb(:"players/index")
end

# NEW
get '/players/new' do
  erb(:"players/new")
end

# CREATE
post '/players' do
  player = Player.new(params)
  player.save()
  redirect "/players"
end

# DELETE
post '/players/:id/delete' do
  id = params[:id].to_i
  player = Player.find(id)
  player.delete()
  redirect '/players'
end

# EDIT
get '/players/:id/edit' do
  id = params[:id].to_i()
  @player = Player.find(id)
  erb(:"players/edit")
end

#UPDATE
post '/players/:id' do
  player = Player.new(params)
  player.update()
  redirect '/players'
end

# SHOW
get '/players/:id' do
  id = params[:id].to_i()
  @player = Player.find(id)
  erb(:"players/show")
end
