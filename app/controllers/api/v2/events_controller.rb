module Api
  module V2
    class EventsController < ApplicationController # Api::BaseController

      #http_basic_authenticate_with name: "admin", password: "secret"

      before_filter :restrict_access

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

    private

      # def restrict_access
      #   puts 'restricting access'
      #   api_key = ApiKey.find_by_access_token(params[:access_token])
      #   puts api_key
      #   head :unauthorized unless api_key
      # end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end
    end
  end
end
