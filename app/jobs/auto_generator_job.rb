class AutoGeneratorJob < ApplicationJob
  queue_as :default

  def perform
    AutoGeneratorService.run_all
  end

end