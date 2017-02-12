require 'rails_helper'

describe Reading do
  it 'should find a reasonable reading for the day' do
    reading = Reading.for_today(
      days_remaining: 30,
      verses_remaining: 1071,
      starting_verse: 'Matthew+1:1'
    )

    expect(reading.to_s).to eq('Matthew+1:1-25,Matthew+2:1-12')
  end
end
