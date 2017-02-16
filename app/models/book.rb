class Book
  attr_reader :name, :chapters, :verse_count

  def initialize(book_name, plan)
    @name = book_name
    @plan = plan

    book_data = BOOKS.detect { |b| b[:name] == name }
    @verse_count = book_data[:verse_count]
    @chapters = book_data[:chapters].map do |chapter_data|
      Chapter.new(self, chapter_data)
    end
  end

  def chapter(number)
    @chapters[number - 1]
  end

  def to_s
    @name
  end

  def chapter_after(chapter)
    @chapters[@chapters.index(chapter) + 1]
  end

  def next
    @plan.next_book(self)
  end

  def first_chapter
    @chapters.first
  end

  def find_chunk(chapter_number, verse_number)
    _chapter = chapter(chapter_number)
    _chapter.chunk_containing(verse_number)
  end
end
