get '/' do
  # render home page
  @users = User.all

  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------


get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

get '/user/:id/profile' do
  if params[:id].to_i == session[:user_id]
    @user = User.find(params[:id])
    erb :profile
  else
    redirect '/'
  end
end

get '/user/:id/addskill' do
  erb :addskill
end

post '/user/:id/addskill' do
  if params[:id].to_i == session[:user_id]
    @user = User.find(params[:id])
    SkillLevel.create({
                       skill_id: params[:skill][:id],
                       user_id: @user.id,
                       experience: params[:skill][:years],
                       formal: params[:skill][:formal]
                       })
    redirect "/user/#{@user.id}/profile"
  else
    redirect '/'
  end
end

get '/edit/:proficiency_id' do
  @proficiency = Proficiency.find(params[:proficiency_id])
  p @proficiency
  erb :edit_skill
end

post '/edit/6' do
  
end


