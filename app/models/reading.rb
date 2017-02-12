class Reading

  def initialize(*chunks)
    @chunks = chunks
  end

  def verse_count
    @chunks.inject(0){|sum,c| sum + c.verse_count }
  end

  def add(chunk)
    Reading.new(*@chunks, chunk)
  end

  def to_s
    grouped = @chunks.group_by { |c| "#{c.book}+#{c.chapter}" }
    grouped.map do |k, chunks|
      first = chunks.first.first_verse
      last = chunks.last.last_verse
      "#{k}:#{first}-#{last}"
    end.join(',')
  end

  def self.for_today(days_remaining:, verses_remaining:, starting_verse:)
    target_length = verses_remaining / days_remaining

    ref = Reference.parse(starting_verse)
    current_chunk = ref.chunk

    options = [new(current_chunk)]
    i = 0
    loop do
      current_chunk = current_chunk.next
      new_reading = options[i].add(current_chunk)
      options << new_reading
      i += 1
      break if new_reading.verse_count >= (target_length + 30)
    end

    options.min_by { |o| (o.verse_count - target_length).abs }
  end
end
