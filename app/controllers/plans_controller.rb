class PlansController < ApplicationController
  before_action :active_plan

  def new
    redirect_to plan_path(active_plan) if active_plan

    @books = Book.all
  end

  def create
    if active_plan.nil?
      @new_plan = Plan.create(book_name: book_name, user: current_user)
    end
  end

  def show
  end

  def destroy
    @plan = Plan.find(plan_id)

    @plan.mark_complete if @plan.active?

    redirect_to new_plan_path
  end

  private

  def plan_id
    params.require(:id)
  end

  def book_name
    params.require(:book)
  end

  def force_new_plan
    params[:force_new_plan]
  end

  def active_plan
    @active_plan ||= Plan.find_by(user: current_user, completed_at: nil)
  end
end
