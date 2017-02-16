task reading: :environment do
  plan = Plan.first
  passages = plan.todays_reading

  response = BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{passages}&version=eng-GNTD")
  readings = [response['search']['result']['passages']['passage']].flatten

  ReadingMailer.todays_reading(plan, readings, passages).deliver_now
end
