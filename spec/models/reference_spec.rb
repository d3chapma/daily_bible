require 'rails_helper'

describe Reference do
  it 'can parse a reference and output the original' do
    ref = 'Matthew+1:1'

    expect(Reference.parse(ref)).to be_a(Reference)
  end

  it 'can find the chunk that contains it' do
    ref = Reference.parse('Matthew+1:1')

    expect(ref.chunk.to_s).to eq('Matthew+1:1-17')
  end
end
