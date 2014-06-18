module Api
  module V1
    class EventsController < ApplicationController # Api::BaseController

      class Event < ::Event
        def as_json(options = {})
          super.merge(name: title.to_s)
        end
      end

      respond_to :json

      def index
        respond_with Event.all
      end

      def show
        respond_with Event.find(params[:id])
      end

      def new
        respond_with Event.new
      end

      def create
        respond_with Event.create(params[:event])
      end

      def edit
        respond_with Event.find(params[:id])
      end

      def update
        respond_with Event.update(params[:id], params[:event])
      end

      def destroy
        respond_with Event.destroy(params[:id])
      end
    end
  end
end
