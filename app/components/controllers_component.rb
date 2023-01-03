# frozen_string_literal: true

class ControllersComponent < ViewComponent::Base
  def initialize
    @basenames = []
    Dir.glob(Rails.root + "app/controllers/*.rb").map do |path|
      @basenames << File.basename(path).remove("_controller.rb") if File.exist?(path)
    end
    @basenames.delete_at(@basenames.index('application'))
    @basenames.delete_at(@basenames.index('session'))
  end
end
