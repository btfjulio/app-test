module ArticlesHelper
  def persisted_comments(comments)
    comments.reject { |comment| comment.new_record? } # only comments for the database
  end
end
