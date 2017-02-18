class Plan < ApplicationRecord
  serialize :books, Array
  serialize :completed_readings, Array

  has_many :completed_readings
  belongs_to :user

  def todays_reading
    Reading.for_today(target_length: target_length, books: books, next_chunk: next_chunk)
  end

  def reading_streak
    CompletedReading.plan_reading_streak(self)
  end

  def percentage_complete
    verses_read * 100 / total_verses
  end

  def days_remaining
    (finish_by - Date.today).to_i
  end

  private

  def books
    @books ||= read_attribute(:books).map { |b| Book.new(b, self) }
  end

  def total_verses
    books.reduce(0) { |t, b| b.verse_count + t }
  end

  def verses_read
    completed_readings.sum(:verse_count)
  end

  def verses_remaining
    total_verses - verses_read
  end

  def target_length
    verses_remaining / days_remaining
  end

  def next_chunk
    if last_reading
      _, book_name, chapter, verse = last_reading.last_passage.match(/(.+)\+(\d+):\d+\-(\d+)/).to_a
    else
      book_name, chapter, verse = [books.first.name, 1, 1]
    end
    book = find_book(book_name)
    chunk = book.find_chunk(chapter.to_i, verse.to_i)

    chunk.next
  end

  def next_book(book)
    books[books.index(book) + 1]
  end

  def find_book(book_name)
    books.detect { |b| b.name == book_name}
  end

  def last_reading
    completed_readings.last
  end
end
