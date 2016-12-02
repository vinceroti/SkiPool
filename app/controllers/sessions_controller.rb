get '/sessions/new' do
  if logged_in?
    return redirect "/users/#{session[:user_id]}"
  elsif request.xhr?
    return erb :'/sessions/new', layout: false
  end
	erb :'/sessions/new'
end

post '/sessions' do
	@user = User.find_by(email: params[:email])
	if @user && @user.authenticate(params[:password])
  	session[:user_id] = @user.id
  	redirect "/"
  elsif !logged_in?
    redirect '/'
  else
    @error = "Invalid Password/Username"
    erb :'/sessions/new'
  end
end

delete '/sessions' do
	session[:user_id] = nil
  if request.xhr?
    return erb :index
  end
	redirect '/'
end
