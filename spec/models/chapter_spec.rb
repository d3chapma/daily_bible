require 'rails_helper'

describe Chapter do
  context '#new' do
    it 'returns a new chapter' do
      chapter_data = { number: 1, verses: 12, chunks: ['1-12', '13-18'] }
      Chapter.new('Matthew', chapter_data)
    end
  end

  context '#to_s' do
    it 'returns the chapter number as a string' do
      chapter_data = { number: 1, verses: 12, chunks: ['1-12', '13-18'] }

      expect(Chapter.new('Matthew', chapter_data).to_s).to eq('1')
    end
  end

  context '#chunk_containing' do
    it 'returns the chunk containing the given verse' do
      chapter_data = { number: 1, verses: 12, chunks: ['1-12', '13-18'] }

      expect(Chapter.new('Matthew', chapter_data).chunk_containing(15).to_s).to eq('Matthew+1:13-18')
    end
  end

  context '#chunk_after' do
    xit 'returns the chunk after the given verses' do
      chapter_data = { number: 1, verses: 12, chunks: ['1-12', '13-18'] }

      expect(Chapter.new('Matthew', chapter_data).chunk_after('1-12').to_s).to eq('Matthew+1:13-18')
    end
  end
end
