class App < Sinatra::Base

    enable :sessions

    def db
        if @db == nil
            @db = SQLite3::Database.new('./db/db.sqlite')
            @db.results_as_hash = true
        end
        return @db
    end

    helpers do

        def h(text)
            Rack::Utils.escape_html(text)
        end

    end

    # sätta h runt varje användar kommentar och använda funktionen

    # get '/' do
    #     erb :index
    # end

    get '/' do
        @movies = db.execute('SELECT * FROM movies')
        erb :index
    end

    get '/movie/:id' do |id|
        @movie = db.execute('SELECT * FROM movies WHERE id = ?', id)[0]
        @ratings = db.execute('SELECT * FROM ratings WHERE movie_id = ?', id)
        erb :'movie'
    end

    get '/new' do
        erb :'new'
    end

    # get '/newuser/' do

    # end

    post '/newuser/' do
        name = params['name']
        username = params['username']
        cleartext_password = params['password']
        hashed_password = BCrypt::Password.create(cleartext_password)
        query = 'INSERT INTO users (name,username,password) VALUES (?,?,?) RETURNING *'
        result = db.execute(query,name,username,hashed_password)
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

        if password_from_db == cleartext_password
            session[:user_id] = user['id']
            @user = db.execute('SELECT * FROM users WHERE username = ?',username).first

        else

            redirect '/login'
        end

        redirect '/profil'
    end


    post '/logout/' do
        user_id = session[:user_id]

        session.destroy

        redirect '/'
    end

    post '/newmovie/' do
        title = params['title']
        year = params['year']
        desc = params['desc']
      query = 'INSERT INTO movies (title,year,desc) VALUES (?,?,?) RETURNING *'
      result = db.execute(query,title,year,desc)
      redirect "/movie/#{result.first['id']}"
    end


    post '/comment/' do

        if session[:user_id]
            redirect '/login'
        else
            # kunna kommentera
        end

    end


    post '/text_comment/' do
        stars = params['stars']
        comment = params['comment']
        user_id = session[:user_id]
      query = 'INSERT INTO ratings (stars,comment,user_id) VALUES (?,?,?) RETURNING *'
      result = db.execute(query,stars,comment,user_id)
      redirect "/ratings/#{result.first['id']}"
    end

    get '/profil' do

        if !session[:user_id]
            redirect '/login'
        end



        user_id = session[:user_id]

        @user = db.execute('SELECT * FROM users WHERE id = ?',user_id).first
        erb :profil
    end

end
