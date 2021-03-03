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
        redirect_to @post, success: 'Статья создана'
    else
        render :new, danger: 'Статья не создана' 
   end
end

    def edit
     #@post = Post.find(params[:id])
        
    end

    def update
     #@post = Post.find(params[:id])
     if @post.update_attributes(post_params)
        redirect_to @post, success: 'Статья успешно обновлена' # Добавляем для flash вывод application.html.erb
     else
        render :edit, denger: 'Статья не обновлена' 
     end
        
    end

    def destroy
     #@post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path, success: 'Статья удалена'  
    end
    
    
    
   private

   def set_post
    @post = Post.find(params[:id])   
   end
   

   def post_params
    params.require(:post).permit(:title, :summary, :body)
    end
   
   
   
end