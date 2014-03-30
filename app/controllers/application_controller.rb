require "find"
require "dir_ext"
require "json_ext"
require "csv"

DEFAULT_PATH = "var/1"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
