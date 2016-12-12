class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :destroy]
    before_filter :authenticate_user!, except: [:index, :show]
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.build
    end

    def create
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.build(post_params)
        @post.save

        redirect_to topic_post_path(@post.topic_id, @post)
    end

    def edit
        @topic = Topic.find(params[:topic_id])

    end

    def update
        if @post.update(post_params)
            redirect_to topic_post_path(@post.topic_id, @post), notice: "Post was successfully updated!"
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy

        redirect_to topic_path(@post.topic_id)
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

        def find_post
            @post = Post.find(params[:id])
        end
end
