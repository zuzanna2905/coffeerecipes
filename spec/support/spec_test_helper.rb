module SpecTestHelper 
    def login(user)
      user = User.find_by(email: user.email)
      request.session[:user_id] = user.id
    end
  
    def current_user
      User.find(request.session[:user_id])
    end

    def create_user
      User.create!(name: 'Jon', email: 'jon@gmail.com', password: 'jon123', password_confirmation: 'jon123')
    end
end