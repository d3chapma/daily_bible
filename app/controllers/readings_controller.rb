class ReadingsController < ApplicationController
  def complete
    @reading = Reading.find(reading_id)

    @plan = @reading.plan

    @plan.complete_reading

    ReadingMailer.send_reading(@plan).deliver unless @plan.completed?
  end

  private

  def reading_id
    params.require(:id)
  end

end
