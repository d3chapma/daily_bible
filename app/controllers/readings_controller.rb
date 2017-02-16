class ReadingsController < ApplicationController
  def update
    @plan = Plan.find(params.require(:id))

    @plan.completed_readings.create(passages: completed, verse_count: verse_count)
  end

  private

  def verse_count
    match, first, second = completed.match(/:(\d+)\-(\d+)/).to_a
    second.to_i - first.to_i + 1
  end

  def completed
    params.require(:completed)
  end
end
