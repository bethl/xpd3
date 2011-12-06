class ApplicationController < ActionController::Base
  before_filter :authenticate
  
  protect_from_forgery
  include SessionsHelper
end
