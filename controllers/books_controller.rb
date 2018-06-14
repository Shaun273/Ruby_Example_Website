class BooksController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__),'..')

  set :views, Proc.new { File.join(root, "views") }

  $books = [
    {
      id: 0,
      title: "Book 1",
      body: "This is my first book, isnt it great!"
    },
    {
      id: 1,
      title: "Book 2",
      body: "This is my second book, isnt it great!"
    },
    {
      id: 2,
      title: "Book 3",
      body: "This is my third book, isnt it great!"
    }
  ]
  # Index
  get '/books' do
    # "<a href='/posts'>Index page</a> <a href='/posts/new'>New page</a>
    # <h1>Hello World</h1>
    # <a href='/upload'>upload page</a>"
    @title = "Books"
    @books = $books
    erb :"books/index"
  end

  # new
  get '/books/new' do
    "PAGENEWPAGENEWPAGENEWPAGENEWPAGENEWPAGENEW"
  end

  # Create
  post "/books/:id" do

  end

  # Show
  get '/books/:id' do

    id = params[:id].to_i
    @book = $books[id]
    @title = @book[:title]

    erb :"books/show"

    # "<h3>This is the #{id} page.</h3>"
  end

  # Edit
  get '/books/:id/edit' do
    "EDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGEEDIT PAGE"
  end

  # UPDATE
  put "/books/:id" do
    "UPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGEUPDATE PAGE"
  end

  # Destroy
  delete '/books/:id' do

  end

end
