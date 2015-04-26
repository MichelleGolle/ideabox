class Admin::BaseController < ApplicationController

  before_action :require_admin

  def require_admin
    render 'errors' unless current_admin?

  end

end
