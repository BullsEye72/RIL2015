class ConceptionsController < ApplicationController
    authorize_resource :class => false

    def index
        @last_modules = HouseModule.order(updated_at: :desc).first(10)
        @last_articles = Article.order(updated_at: :desc).first(10)
    end
end
