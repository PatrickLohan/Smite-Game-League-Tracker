require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
also_reload('.models/*')

require_relative('./controllers/league.rb')
require_relative('./controllers/team.rb')
require_relative('./controllers/player.rb')

get '/' do
  erb(:home)
end
