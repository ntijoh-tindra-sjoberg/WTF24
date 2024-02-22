class App < Sinatra::Base

    def db
        if @db == nil
            @db = SQLite3::Database.new('./db/db1.sqlite')
            @db.results_as_hash = true
        end
        return @db
    end

    get '/' do
        erb :index
    end

    get '/new' do

        #spara användare och hashed_password till databasen
        cleartext_password = params['password']
        hashed_password = BCrypt::Password.create(cleartext_password)

        erb :'new'
    end

    post '/newuser/' do
        name = params['name']
        username = params['username']
        password = params['password']
      query = 'INSERT INTO users (name,username,password) VALUES (?,?,?) RETURNING *'
      result = db.execute(query,name,username,password)
      redirect "/login"
      #redirect "/contact/#{result.first['id']}"
    end

    get '/login' do
            erb :'login'
    end

    post '/login/' do

        username = params['username']
        cleartext_password = params['password']

        user = db.execute('SELECT * FROM users WHERE username = ?', username).first

        password_from_db = BCrypt::Password.new(user['password'])

        if password_from_db == clertext_password
            session[:user_id] = user['id']
            #
        else

            erb :'login'
        end

        erb :'profil'
    end

    post 'logout' do

        if user_id = session[:user_id]
            session.destroy
        else
            erb :'login'
        end

    end


end
