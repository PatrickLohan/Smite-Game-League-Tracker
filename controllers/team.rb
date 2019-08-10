require_relative('../models/team.rb')

# INDEX
get '/teams' do
  @teams = Team.all()
  erb(:"teams/index")
end
