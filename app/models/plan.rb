class Plan < ApplicationRecord
  belongs_to :user

  def active?
    completed_at.nil?
  end

  def mark_complete
    update!(completed_at: DateTime.now)
  end

  private

end
