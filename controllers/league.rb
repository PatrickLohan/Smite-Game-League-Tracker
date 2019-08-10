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
