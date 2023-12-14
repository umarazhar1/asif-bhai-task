class BugsController < ApplicationController

  before_action :authorize_qa, only: [:new, :create]

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def authorize_qa
    redirect_to root_path, alert: 'Only QA users can create bugs.' unless current_user.qa?
  end

end
