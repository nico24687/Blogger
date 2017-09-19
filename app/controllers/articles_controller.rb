class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end 
    #so the above tells rails when we go to www.localhost300.com/articles we want to do execute the indented code
    #notice articles has to be an instance variable. We want it to be visible from both the controller and the view
    
    def show
        @article = Article.find(params[:id])
    end
    #the above is able to deal with a user clicking on a specific blog title
    
end
