class TopicsController < ApplicationController
    before_action :find_topic, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @forum = Mainforum.find(params[:mainforum_id])
        @topic = @forum.topics.build
    end

    def create
        @forum = Mainforum.find(params[:mainforum_id])
        @topic = @forum.topics.build(topic_params)
        @topic.save

        redirect_to mainforum_topic_path(@forum, @topic)
    end

    def edit
    end

    def update
        if @topic.update(topic_params)
            redirect_to mainforum_topic_path(@forum, @topic), notice: "Topic was successfully updated!"
        else
            render 'edit'
        end
    end

    def destroy
        @topic.destroy

        redirect_to root_path
    end

    private
        def topic_params
            params.require(:topic).permit(:title, :description)
        end

        def find_topic
            @forum = Mainforum.find(params[:mainforum_id])
            @topic = @forum.topics.find(params[:id])
        end
end
