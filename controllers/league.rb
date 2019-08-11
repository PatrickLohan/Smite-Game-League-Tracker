require_relative('../models/league.rb')

#INDEX
get '/leagues' do
  @leagues = League.all()
  erb(:"leagues/index")
end

# NEW
get '/leagues/new' do
  erb(:"leagues/new")
end

# CREATE
post '/leagues' do
  league = League.new(params)
  league.save()
  redirect "/leagues"
end

# DELETE
post '/leagues/:id/delete' do
  id = params[:id].to_i
  league = League.find(id)
  league.delete()
  redirect '/leagues'
end

# EDIT
get '/leagues/:id/edit' do
  id = params[:id].to_i()
  @league = League.find(id)
  erb(:"leagues/edit")
end

#UPDATE
post '/leagues/:id' do
  league = League.new(params)
  league.update()
  redirect '/leagues'
end

# SHOW
get '/leagues/:id' do
  id = params[:id].to_i()
  @league = League.find(id)
  erb(:"leagues/show")
end
