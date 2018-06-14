require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require_relative "controllers/posts_controller.rb"
require_relative "controllers/fruit_controller.rb"
require_relative "controllers/books_controller.rb"

use Rack::MethodOverride
run PostsController
use FruitController
use BooksController
