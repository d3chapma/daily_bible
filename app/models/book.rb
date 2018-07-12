class Book
  attr_reader :name, :chapters

  def self.get(book_name)
    BOOKS.find { |book| book.name == book_name }
  end

  def self.first
    BOOKS.first
  end

  def self.last
    BOOKS.last
  end

  def self.all
    BOOKS
  end

  def initialize(book_name, testament:, chapters:)
    @name = book_name
    @testament = testament
    @chapters = chapters
  end

  def to_s
    @name
  end

  def next
    BOOKS[(index + 1) % 66]
  end

  def prev
    BOOKS[index - 1]
  end

  private

  def index
    BOOKS.index(self)
  end
end


BOOKS = [
  Book.new("Genesis", testament: :old, chapters: 50),
  Book.new("Exodus", testament: :old, chapters: 40),
  Book.new("Leviticus", testament: :old, chapters: 27),
  Book.new("Numbers", testament: :old, chapters: 36),
  Book.new("Deuteronomy", testament: :old, chapters: 34),
  Book.new("Joshua", testament: :old, chapters: 24),
  Book.new("Judges", testament: :old, chapters: 21),
  Book.new("Ruth", testament: :old, chapters: 4),
  Book.new("1 Samuel", testament: :old, chapters: 31),
  Book.new("2 Samuel", testament: :old, chapters: 24),
  Book.new("1 Kings", testament: :old, chapters: 22),
  Book.new("2 Kings", testament: :old, chapters: 25),
  Book.new("1 Chronicles", testament: :old, chapters: 29),
  Book.new("2 Chronicles", testament: :old, chapters: 36),
  Book.new("Ezra", testament: :old, chapters: 10),
  Book.new("Nehemiah", testament: :old, chapters: 13),
  Book.new("Esther", testament: :old, chapters: 10),
  Book.new("Job", testament: :old, chapters: 42),
  Book.new("Psalms", testament: :old, chapters: 150),
  Book.new("Proverbs", testament: :old, chapters: 31),
  Book.new("Ecclesiastes", testament: :old, chapters: 12),
  Book.new("Song of Songs", testament: :old, chapters: 8),
  Book.new("Isaiah", testament: :old, chapters: 66),
  Book.new("Jeremiah", testament: :old, chapters: 52),
  Book.new("Lamentations", testament: :old, chapters: 5),
  Book.new("Ezekiel", testament: :old, chapters: 48),
  Book.new("Daniel", testament: :old, chapters: 12),
  Book.new("Hosea", testament: :old, chapters: 14),
  Book.new("Joel", testament: :old, chapters: 3),
  Book.new("Amos", testament: :old, chapters: 9),
  Book.new("Obadiah", testament: :old, chapters: 1),
  Book.new("Jonah", testament: :old, chapters: 4),
  Book.new("Micah", testament: :old, chapters: 7),
  Book.new("Nahum", testament: :old, chapters: 3),
  Book.new("Habakkuk", testament: :old, chapters: 3),
  Book.new("Zephaniah", testament: :old, chapters: 3),
  Book.new("Haggai", testament: :old, chapters: 2),
  Book.new("Zechariah", testament: :old, chapters: 14),
  Book.new("Malachi", testament: :old, chapters: 4),
  Book.new("Matthew", testament: :new, chapters: 28),
  Book.new("Mark", testament: :new, chapters: 16),
  Book.new("Luke", testament: :new, chapters: 24),
  Book.new("John", testament: :new, chapters: 21),
  Book.new("Acts", testament: :new, chapters: 28),
  Book.new("Romans", testament: :new, chapters: 16),
  Book.new("1 Corinthians", testament: :new, chapters: 16),
  Book.new("2 Corinthians", testament: :new, chapters: 13),
  Book.new("Galatians", testament: :new, chapters: 6),
  Book.new("Ephesians", testament: :new, chapters: 6),
  Book.new("Philippians", testament: :new, chapters: 4),
  Book.new("Colossians", testament: :new, chapters: 4),
  Book.new("1 Thessalonians", testament: :new, chapters: 5),
  Book.new("2 Thessalonians", testament: :new, chapters: 3),
  Book.new("1 Timothy", testament: :new, chapters: 6),
  Book.new("2 Timothy", testament: :new, chapters: 4),
  Book.new("Titus", testament: :new, chapters: 3),
  Book.new("Philemon", testament: :new, chapters: 1),
  Book.new("Hebrews", testament: :new, chapters: 13),
  Book.new("James", testament: :new, chapters: 5),
  Book.new("1 Peter", testament: :new, chapters: 5),
  Book.new("2 Peter", testament: :new, chapters: 3),
  Book.new("1 John", testament: :new, chapters: 5),
  Book.new("2 John", testament: :new, chapters: 1),
  Book.new("3 John", testament: :new, chapters: 1),
  Book.new("Jude", testament: :new, chapters: 1),
  Book.new("Revelation", testament: :new, chapters: 22),
]
