class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionsHelper
  include MembersHelper
  include ArticlesHelper
end
