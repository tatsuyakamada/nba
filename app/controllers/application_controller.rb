class ApplicationController < ActionController::Base
  include SessionsHelper
  include MembersHelper
  include ArticlesHelper
end
