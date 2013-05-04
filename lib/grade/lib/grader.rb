# -*- coding: utf-8 -*-
require 'iconv'
require 'rchardet'

class Grader
  IGNORE_CHARS = [' ', '，', '。', '！', '…', '_', '、', '；']
  HAN_PATTERN = /^[\u4e00-\u9fa5]+$/

  # Count the frequency of each word in the file
  def self.count_frequency(*files)
    ret = {}
    total = 0
    files.each do |file|
      content = File.read(file)
      # {"encoding"=>"GB2312", "confidence"=>0.99} 
      cd = CharDet.detect(content)
      raise 'Cannot parse this file' if cd["confidence"] < 0.8
      content = Iconv.conv('UTF-8', cd['encoding'], content) if cd['encoding'] != 'UTF-8'
      content.each_char do |c|
        next unless HAN_PATTERN.match(c)
        if ret.keys.include?(c)
          ret[c] += 1
        else
          ret[c] = 1
        end
        total += 1
      end

      ret = Hash[ret.sort_by{ |k,v| v}.reverse]
    end
    return total, ret
  end

  def self.grade(pattern_file, target_file)
    good_chars = IO.read(pattern_file).split("\n")
    #raise 'No pattern file exist' unless FileTest.exist?(target_file)
    content = File.read(target_file)
    content = Iconv.conv('UTF-8', 'GB2312', content) unless content.valid_encoding?
    raise 'Cannot parse the encoding of the file' unless content.valid_encoding?
    #IGNORE_CHARS.each {|c| content.delete!(c)}
    bad_words = []
    total = 0
    content.each_char do |c|
      next unless HAN_PATTERN.match(c)
      total += 1
      bad_words << c unless good_chars.include?(c)
    end
    return total, bad_words

  end
end
