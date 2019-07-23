module SpecTestHelper 
    def login(user)
      user = User.find_by(email: user.email)
      request.session[:user_id] = user.id
    end

    def is_admin?(user)
      user.admin
    end

    def current_user
      User.find(request.session[:user_id])
    end
end