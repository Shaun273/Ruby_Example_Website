class FruitController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__),'..')

  set :views, Proc.new { File.join(root, "views") }

  $fruits = [
    {
      id: 0,
      title: "Fruit one",
      body: "This is a banana"
    },
    {
      id: 1,
      title: "Fruit two",
      body: "This is an orange"
    },
    {
      id: 2,
      title: "Fruit three",
      body: "This is an apple"
    },
  ]

  get '/fruits' do
    # "<a href='/fruit'>Index page</a> <a href='/fruit/new'>New page</a>
    # <h1>This is Fruit!!</h1>
    # <a href='../posts'>Posts page</a>"
    @title = "Welcome to Fruit"
    @fruits = $fruits
    erb :"fruits/index"
  end

  # new
  get '/fruits/new' do
    "PAGENEWPAGENEWPAGENEWPAGENEWPAGENEWPAGENEW"
  end

  # Create
  post "/fruits/:id" do

  end

  # Show
  get '/fruits/:id' do

    id = params[:id].to_i
    @fruit = $fruits[id]
    @title = @fruit[:title]

    erb :"fruits/show"

  end

  # Edit
  get '/fruits/:id/edit' do
    "EDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGE"
  end

  # UPDATE
  put "/fruits/:id" do
    "UPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGE"
  end

  # Destroy
  delete '/fruits/:id' do

  end
end
