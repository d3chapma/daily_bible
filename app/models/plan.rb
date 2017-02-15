class Plan < ApplicationRecord
  serialize :books, Array

  def todays_reading
    total_verses = books.reduce(0) { |t, b| BOOKS.detect { |n| n[:name] == b }[:verse_count] + t }
    verses_remaining = total_verses
    Reading.for_today(end_date: finish_by, verses_remaining: verses_remaining, starting_verse: "Romans+1:1")
  end
end
