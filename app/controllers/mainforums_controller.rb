class MainforumsController < ApplicationController
    before_action :find_forum, only: [:show, :edit, :update, :destroy]

    def index
        @forums = Mainforum.all
    end

    def show
    end

    def new
        @forum = Mainforum.new
    end

    def create
        @forum = Mainforum.new(forum_params)
        @forum.save

        redirect_to @forum
    end

    def edit
    end

    def update
        if @forum.update(forum_params)
            redirect_to @forum, notice: "Forum was successfully updated!"
        else
            render 'edit'
        end
    end

    def destroy
        @forum.destroy

        redirect_to root_path
    end

    private
        def forum_params
            params.require(:mainforum).permit(:title, :description)
        end

        def find_forum
            @forum = Mainforum.find(params[:id])
        end
end
