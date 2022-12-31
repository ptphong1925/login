class ViolationJob < ApplicationJob
  queue_as :default

  def perform
    ViolationService.scan_all
  end
end