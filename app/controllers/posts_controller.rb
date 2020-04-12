class PostsController < ApplicationController
    before_action :find_post, only: [ :show, :edit, :destroy, :update]

    def index
        @posts = Post.all.order("created_at DESC")
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        @post.destroy

        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
        @post = Post.find(params[:id])
    end

end
