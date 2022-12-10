# frozen_string_literal: true

class FilterFormComponent < ViewComponent::Base
  def initialize(url:, method:)
    @url = url
    @method = method
  end

end
