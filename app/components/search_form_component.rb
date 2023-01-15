# frozen_string_literal: true

class SearchFormComponent < ViewComponent::Base
  def initialize(url:, method: :get)
    @url = url
    @method = method
  end

end
