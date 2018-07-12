class ReadingMailer < ApplicationMailer
  def send_reading(plan)
    @plan = plan

    @reading = @plan.current_reading

    mail(to: 'talk2dc@gmail.com')
  end
end
