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

    def create_user
      User.create!(name: 'Jon', email: 'jon@gmail.com', password: 'jon123', password_confirmation: 'jon123')
    end

    def create_user2
      User.create!(name: 'Arya', email: 'arya@gmail.com', password: 'arya123', password_confirmation: 'arya123')      
    end

    def create_admin
      User.create!(name: 'Jon', email: 'jon@gmail.com', password: 'jon123', password_confirmation: 'jon123', admin: true)
    end

    def create_roaster
      Roaster.create!(name: 'Audun Coffee', country: 'Poland')
    end

    def create_bean
      Bean.create!(name: 'Peru El Diamante', method: 'Washed', country: 'Peru', roast: 'light', description: 'Varietal: Caturra', roaster_id: 1)
    end

    def create_recipe
      Recipe.create!(user_id: 1, bean_id: 1, roaster_id: 1, temperature: 90, water: 500, dose: 30, method: 'V60', grinder: 'Comandante', clicks: 15, time: Time.now, description: 'non', rate: 5, likes: 0)
    end

    def create_favorite
      Favorite.create!(recipe_id: 1, user_id: 1)
    end

end