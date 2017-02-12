class Reference
  def initialize(book_name, chapter, verse)
    @book = Book.new(book_name)
    @chapter = @book.chapters[chapter.to_i-1]
    @verse = verse.to_i
  end

  def self.parse(ref)
    _, book_name, chapter, verse = ref.match(/(.+)\+(\d+):(\d+)/).to_a
    new(book_name, chapter, verse)
  end

  def to_s
    "#{@book}+#{@chapter}:#{@verse}"
  end

  def chunk
    @chapter.chunk_containing(@verse)
  end
end
