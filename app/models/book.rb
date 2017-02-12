class Book
  attr_reader :name, :chapters

  def initialize(book_name)
    @name = book_name

    book_data = BOOKS.detect { |b| b[:name] == name }
    @next_book_name = book_data[:next]
    @chapters = book_data[:chapters].map do |chapter_data|
      Chapter.new(self, chapter_data)
    end
  end

  def chapter(number)
    @chapters[number-1]
  end

  def to_s
    @name
  end

  def chapter_after(chapter)
    @chapters[@chapters.index(chapter) + 1]
  end

  def next
    Book.new(@next_book_name)
  end

  def first_chapter
    @chapters.first
  end
end
