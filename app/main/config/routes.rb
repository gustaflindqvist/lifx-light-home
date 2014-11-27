# See https://github.com/voltrb/volt#routes for more info on routes

get "/collections/{{_route}}", _action: 'collections'
get "/collections", _action: 'collections'

get '/about', _action: 'about'

# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user', _action: 'signup'
get '/login', _controller: 'user', _action: 'login'
get '/account', _controller: 'user', _action: 'account'

get "/light/settings/{{_index}}", _controller: 'light', _action: 'settings'
get "/light/settings", _controller: 'light', _action: 'settings'
get "/light/bulbs/{{_index}}", _controller: 'light', _action: 'bulbs'
get "/light/bulbs", _controller: 'light', _action: 'bulbs'

# The main route, this should be last.  It will match any params not previously matched.
get '/', {}
