require_relative('../models/league.rb')

#INDEX
get '/leagues' do
  @leagues = League.all()
  erb(:"leagues/index")
end
