class Plan < ApplicationRecord
  belongs_to :user
  has_many :readings, ->{ order(:created_at) }, dependent: :destroy

  def self.active_for(user)
    find_by(user: user, completed_at: nil)
  end

  def active?
    completed_at.nil?
  end

  def mark_complete
    update!(completed_at: DateTime.now)
  end

  def start_reading
    return if started?

    Reading.create_for(self, chapter: 1)
  end

  def current_reading
    readings.find_by(completed_at: nil)
  end

  def complete_reading(reading)
    return if completed? || reading.completed?

    chapter = reading.chapter
    book = reading.book

    reading.mark_complete

    if chapter >= book.chapters
      mark_complete
    else
      Reading.create_for(self, chapter: chapter + 1)
    end
  end

  def started?
    readings.present?
  end

  def completed?
    completed_at.present?
  end
end
