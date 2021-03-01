class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy] # Вызываем метод вместо @post = Post.find(params[:id])

   def index # вывод всех постов из БД
    @posts = Post.all 
   end

   def show # вывод одного поста с содержимым
    #@post = Post.find(params[:id])
   end

   def new
    @post = Post.new  
   end

   def create
    @post = Post.new(post_params)
    if @post.save 
        redirect_to @post
    else
        render :new  
   end
end

    def edit
     #@post = Post.find(params[:id])
        
    end

    def update
     #@post = Post.find(params[:id])
     if @post.update_attributes(post_params)
        redirect_to @post
     else
        render :edit 
     end
        
    end

    def destroy
     #@post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path   
    end
    
    
    
   private

   def set_post
    @post = Post.find(params[:id])   
   end
   

   def post_params
    params.require(:post).permit(:title, :summary, :body)
    end
   
   
   
end