class Chapter
  attr_reader :chunks

  def initialize(book, chapter_data)
    @book = book
    @number = chapter_data[:number].to_i
    @verses = chapter_data[:verses]
    @chunks = chapter_data[:chunks].map do |verses|
      Chunk.new(@book, self, verses)
    end
  end

  def to_s
    @number.to_s
  end

  def chunk_containing(verse)
    @chunks.detect { |chunk| chunk.contains? verse }
  end

  def chunk_after(chunk)
    @chunks[@chunks.index(chunk) + 1]
  end

  def next
    @book.chapter_after(self) || @book.next.first_chapter
  end

  def first_chunk
    @chunks.first
  end
end
