# See https://github.com/voltrb/volt#routes for more info on routes

get "/settings/{{_index}}", _action: 'settings'
get "/settings", _action: 'settings'

get "/collections/{{_route}}", _action: 'collections'
get "/collections", _action: 'collections'


get '/about', _action: 'about'

# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user-templates', _action: 'signup'
get '/login', _controller: 'user-templates', _action: 'login'


# The main route, this should be last.  It will match any params not previously matched.
get '/', {}
