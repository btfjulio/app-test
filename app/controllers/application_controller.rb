class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:index, :show]
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected

  def resources_not_found
  end
end
