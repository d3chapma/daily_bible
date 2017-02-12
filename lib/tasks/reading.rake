task reading: :environment do
  reading = Reading.for_today(
    days_remaining: 30,
    verses_remaining: 1071,
    starting_verse: 'Matthew+1:1'
  )

  BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{reading}&version=eng-GNTD")
end
