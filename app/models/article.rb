require File.join(File.dirname(__FILE__), '/../../lib/grade/lib/grader')
class Article < ActiveRecord::Base
  attr_accessible :avatar, :filename
  has_attached_file :avatar
  validates_attachment :avatar,  :presence => true,
  :content_type => { :content_type => "text/plain" },
  :size => { :in => 0..10.kilobytes }
  PATTERN_FILE = 'lib/grade/result/pattern/pattern_article/2000'
  def grade
    @total, @bad_words = Grader.grade(PATTERN_FILE, avatar.path)
    return self
  end

  def name
    filename.sub('.txt', '')
  end

  def filename
    avatar_file_name
  end

  def bad_words
    @bad_words
  end

  def bad_word_percentage
    ((Float(@bad_words.length)/@total)*100).round(3)
  end

  def good_word_percentage
    ((Float(@total-@bad_words.length)/@total)*100).round(3)
  end

  def total
    @total
  end
end
