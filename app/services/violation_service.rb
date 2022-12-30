class ViolationService < ApplicationService
  def self.scan_comment
    comments = Comment.where('created_at < ?', Time.now - 30.minutes).pluck(:content)
    violations = Violation.pluck(:name)
  end

  def self.scan_subcomment
  end
end
