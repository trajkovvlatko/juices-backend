class HomeController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
  end
end
