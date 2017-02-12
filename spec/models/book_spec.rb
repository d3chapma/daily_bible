require 'rails_helper'

describe Book do
  context '#new' do
    it 'returns a new book' do
      Book.new("Matthew")
    end
  end

  context '#to_s' do
    it 'returns the book name' do
      expect(Book.new("Matthew").to_s).to eq('Matthew')
    end
  end

  context '#chapter' do
    it 'returns the chapter' do
      expect(Book.new('Matthew').chapter(15).to_s).to eq('15')
    end
  end
end
