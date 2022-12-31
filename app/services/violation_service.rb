class ViolationService < ApplicationService
  VIOLATION_REGEXP = Regexp.union(Violation.pluck(:name))

  def self.scan_all
    self.scan_comment
    self.scan_subcomment
  end

  def self.scan_comment
    comments = Comment.where('created_at < ?', Time.now - 5.minutes)
    comments.find_each do |comment|
      if comment.content.match?(VIOLATION_REGEXP)
        scaned_content = comment.content.gsub(VIOLATION_REGEXP) { |match| '*'*(match.size) }
        comment.update(content: scaned_content)
      end
    end
  end

  def self.scan_subcomment
    subcomments = Subcomment.where('created_at < ?', Time.now - 5.minutes)
    subcomments.find_each do |subcomment|
      if subcomment.content.match?(VIOLATION_REGEXP)
        scaned_content = subcomment.content.gsub(VIOLATION_REGEXP) { |match| '*'*(match.size) }
        subcomment.update(content: scaned_content)
      end
    end
  end

end
