class ReadingMailer < ApplicationMailer
  def todays_reading(plan, readings, passages)
    @plan = plan
    @readings = readings
    @passages = passages

    mail(to: 'talk2dc@gmail.com')
  end
end
