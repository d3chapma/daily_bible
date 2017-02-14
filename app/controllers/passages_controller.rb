class PassagesController < ApplicationController

  def show
    reading = Reading.for_today(
      days_remaining: 30,
      verses_remaining: 1071,
      starting_verse: 'Matthew+1:1'
    )
    response = BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{reading}&version=eng-GNTD")
    @readings = response['search']['result']['passages']['passage']
  end
end
