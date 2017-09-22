module ArticlesHelper
    def article_params
        params.require(:article).permit(:title, :body, :tag_list)
    end
    #the above gets round the fact that rails does not really like it if you save parameters sent into us via the params hash
end
