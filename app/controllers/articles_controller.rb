class ArticlesController < ApplicationController
    
    include ArticlesHelper
    #the above just means we now have access to any of the methods we created in articles_helper.rb
    #we need access to the article_params method to work around the security issue when saving content from the params hash
    
    def index
        @articles = Article.all
    end 
    #so the above tells rails when we go to www.localhost300.com/articles we want to do execute the indented code
    #notice articles has to be an instance variable. We want it to be visible from both the controller and the view
    
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    #the above is able to deal with a user clicking on a specific blog title
    
    
    #when we clicked new article we get an error because the router went looking for an action named new inside the articles controller 
    #but it could not find one 
    #so we are going to create this action below 
    
    def new 
        @article = Article.new
    end
    #so the above solves the unknonw action error but now we get an error saying there is no template
    #we added a template new.html.erb and put an h1 in it to solve the error 
    #note the name of the template matches the name of the above controller method
    #notice that we had to create an article in this action to deal with the fact that we have form_for(@article) in new.html.erb
    
    def create 
        @article = Article.new(article_params)
        @article.save
        
        flash.notice = "Aricle #{@article.title} created"
        redirect_to articles_path(@article)
    end 
    #this action above helps us deal with actually creating the new post i.e. when we hit the submit button 
    #notice by using the key word fail you can get the value of the cotent in the params hash from the form data 
    #for security reasons it is not a good idea save parameters sent into us via the params hash. To deal with this you have to use strong parameters
    #we do this work around in articles_helper.rb using the require method and the permit method to say its okay to save via the params hash
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        flash.notice = "Artilce '#{@article.title} deleted"
        redirect_to articles_path
        
    end
    
    def edit 
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' updated"
        
        redirect_to article_path(@article)
    end
    
    
    
end
