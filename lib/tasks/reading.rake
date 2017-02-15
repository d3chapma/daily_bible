task reading: :environment do
  reading = Plan.first.todays_reading

  response = BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{reading}&version=eng-GNTD")
  readings = response['search']['result']['passages']['passage']

  ReadingMailer.todays_reading(readings).deliver_now
end
