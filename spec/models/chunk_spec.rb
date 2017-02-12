require 'rails_helper'

describe Chunk do
  context '#to_s' do
    it 'returns string representation' do
      expect(Chunk.new('Matthew', 1, '1-17').to_s).to eq('Matthew+1:1-17')
    end
  end

  context '#contains?' do
    it 'returns true if verse is in range' do
      expect(Chunk.new('Matthew', 1, '1-17').contains? 4).to be_truthy
    end

    it 'returns false if verse in not in range' do
      expect(Chunk.new('Matthew', 1, '1-17').contains? 18).to be_falsey
    end
  end

  context '#next' do
    it 'returns the next chunk' do
      book = Book.new('Matthew')

      chunk = book.chapters.first.chunks.first

      expect(chunk.next.to_s).to eq('Matthew+1:18-25')
    end

    it 'gets the chunk from the next chapter if necessary' do
      book = Book.new('Matthew')

      chunk = book.chapters.first.chunks.last

      expect(chunk.next.to_s).to eq('Matthew+2:1-12')
    end

    it 'gets the chunk from the next book if necessary' do
      book = Book.new('Matthew')

      chunk = book.chapters.last.chunks.last

      expect(chunk.next.to_s).to eq('Mark+1:1-8')
    end
  end
end
