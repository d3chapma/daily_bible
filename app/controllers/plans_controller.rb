class PlansController < ApplicationController
  def new
    @books = Book.all
  end

  def create
    @active_plan = Plan.find_by(user: current_user, completed_at: nil)

    if !@active_plan
      @new_plan = Plan.new(book_name: book_name, user: current_user)
    end
  end

  private

  def book_name
    params.require(:book)
  end

  def force_new_plan
    params[:force_new_plan]
  end
end
