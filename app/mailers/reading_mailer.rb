class ReadingMailer < ApplicationMailer
  def todays_reading(readings)
    @readings = readings

    mail(to: 'talk2dc@gmail.com')
  end
end
