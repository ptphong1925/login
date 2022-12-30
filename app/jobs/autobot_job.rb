class AutobotJob < ApplicationJob
  queue_as :default

  def perform
    AutobotService.run_comment
  end

end