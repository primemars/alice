require File.join(File.dirname(__FILE__), '/../../lib/grade/lib/grader')
class Article < ActiveRecord::Base
  attr_accessible :avatar, :filename
  has_attached_file :avatar


  def grade
    pattern_file = 'lib/grade/result/pattern/pattern_article/2000'
    total, bad_words = Grader.grade(pattern_file, avatar.path)
    good_word_percentage = ((Float(total-bad_words)/total)*100).round(3)
  end


  def filename
    avatar_file_name
  end
end
