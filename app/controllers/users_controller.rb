get '/users/new' do
	if logged_in?
  	return redirect '/'
  end
  if request.xhr? 
  	return erb :'users/new', layout: false
  end
  erb :'users/new'
end

get '/users/:user_id' do
	@user = User.find(params[:user_id])

	if logged_in? && @user
		@user = User.find(params[:user_id])
		return erb :'users/show'
	elsif request.xhr?
	 	return erb :'users/show', layout: false
	elsif @user
		return erb :'status/404'
	end
	erb :'status/403'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{session[:user_id]}"
	else
		@errors = @user.errors.full_messages
		erb :'users/new'
	end
end