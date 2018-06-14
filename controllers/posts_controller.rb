class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Model
  $posts = [
    {
      id: 0,
      title: "Post 1",
      body: "This is my first post, isnt it great!"
    },
    {
      id: 1,
      title: "Post 2",
      body: "This is my second post, isnt it great!"
    },
    {
      id: 2,
      title: "Post 3",
      body: "This is my third post, isnt it great!"
    }
  ]

  # $posts[1][:title]

  # Landing Page
  get '/' do
    "<h1>Hello World</h1>
    <a href='/posts'>Posts page</a> <a href='/fruit'>Fruit page</a> <a href='/books'>Book page</a>"
  end

  get '/posts' do
    # "<a href='/posts'>Index page</a> <a href='/posts/new'>New page</a>
    # <h1>Hello World</h1>
    # <a href='/upload'>upload page</a>"
    @title = "Posts"
    @posts = Post.all
    erb :"posts/index"
  end

  # new
  get '/posts/new' do
    # "PAGENEWPAGENEWPAGENEWPAGENEWPAGENEWPAGENEW"
    @post = Post.new
    erb :"posts/new"
  end

  # Create
  post "/posts/" do
    # puts params
    # new_post = {
    #   id: $posts.length,
    #   title: params[:title],
    #   body: params[:body]
    # }
    # $posts.push(new_post)
    # redirect "/posts"

    post = Post.new
    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect "/posts"
  end

  # Show
  get '/posts/:id' do

    id = params[:id].to_i
    @post = Post.find id
    @title = @post.title
    erb :"posts/show"

    # "<h3>This is the #{id} page.</h3>"
  end

  # Edit
  get '/posts/:id/edit' do
    id = params[:id].to_i

    @post = Post.find id

    erb :"posts/edit"
  end

  # UPDATE
  put "/posts/:id" do
    # "UPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGE"
    id = params[:id].to_i

    post = Post.find id

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect "/posts/#{id}"

  end

  # Destroy
  delete '/posts/:id' do
    id = params[:id].to_i
    Post.destroy(id)
    redirect "/posts"
  end
end
