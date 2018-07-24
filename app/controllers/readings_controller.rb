class ReadingsController < ApplicationController
  def complete
    @reading = Reading.find(reading_id)
    @plan = @reading.plan

    if @reading.completed?
      render :already_completed
    else
      @plan.complete_reading(@reading)

      ReadingMailer.send_reading(@plan).deliver unless @plan.completed?
      @reading.mark_as_sent
    end
  end

  private

  def reading_id
    params.require(:id)
  end

end
