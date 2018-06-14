require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require 'pg'
require_relative "controllers/posts_controller.rb"
require_relative "controllers/fruit_controller.rb"
require_relative "controllers/books_controller.rb"
require_relative "models/post.rb"

use Rack::MethodOverride
use FruitController
use BooksController
run PostsController
