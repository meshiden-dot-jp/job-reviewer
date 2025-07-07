class WelcomeController < ApplicationController
  def index
    @categories = ParttimeJob::CATEGORIES
  end
end
