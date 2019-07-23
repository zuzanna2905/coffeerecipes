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

    def create_user_and_log_in
      create :user, email: 'user@test.com', password: 'password', password_confirmation: 'password'
      visit 'login'
      fill_in :logins_email, with: 'user@test.com'
      fill_in :logins_password, with: 'password'
      click_on 'logins_submit'
    end

    def create_admin_and_log_in
      create :user, email: 'admin@test.com', password: 'password', password_confirmation: 'password', admin: true
      visit 'login'
      fill_in :logins_email, with: 'admin@test.com'
      fill_in :logins_password, with: 'password'
      click_on 'logins_submit'
    end
end