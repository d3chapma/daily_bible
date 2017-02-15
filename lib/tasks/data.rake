task data: :environment do
  book = "Revelation"
  short = "Rev"
  chapters = 22
  (1..chapters).each do |chapter|
    puts "  {"
    puts "    number: #{chapter},"
    response = BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{book}+#{chapter}&version=eng-GNTD")
    split_verses = response['search']['result']['passages']['passage']['text'].scan(/<h3|<sup id=\"#{short}.#{chapter}.(\d+)/).flatten.split(nil)
    result = split_verses.map do |s|
      next if s.empty?
      f = s.first
      l = s.last
      f == l ? f : "#{f}-#{l}"
    end.compact
    puts "    verse_count: #{split_verses.last.last},"
    puts "    chunks: ['#{result.join("', '")}']"
    puts "  },"
  end
end
