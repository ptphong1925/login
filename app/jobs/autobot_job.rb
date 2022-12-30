class AutobotJob < ApplicationJob
  queue_as :default

  def perform
    AutobotService.run_all
  end

end