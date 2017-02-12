class Chunk
  attr_reader :book, :chapter

  def initialize(book, chapter, verses)
    @book = book
    @chapter = chapter
    @verses = verses
  end

  def to_s
    "#{@book}+#{@chapter}:#{@verses}"
  end

  def contains?(verse)
    first, last = @verses.scan(/\d+/)
    (first.to_i..last.to_i).include? verse
  end

  def next
    @chapter.chunk_after(self) || @chapter.next.first_chunk
  end

  def verse_count
    first, last = @verses.scan(/\d+/)
    last.to_i - first.to_i + 1
  end

  def first_verse
    first, _ = @verses.scan(/\d+/)
    first.to_i
  end

  def last_verse
    _, last = @verses.scan(/\d+/)
    last.to_i
  end
end
