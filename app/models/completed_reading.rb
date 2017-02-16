class CompletedReading < ApplicationRecord
  default_scope { order(created_at: :asc) }

  def last_passage
    passages.split(',').last
  end
end
