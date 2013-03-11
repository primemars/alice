# -*- coding: utf-8 -*-
class Grader
  IGNORE_CHARS = [' ', '，', '。', '！', '…', '_', '、', '；']
  HAN_PATTERN = /^[\u4e00-\u9fa5]+$/

  # Count the frequency of each word in the file
  def self.count_frequency(*files)
    ret = {}
    total = 0
    files.each do |file|
      content = IO.read(file)

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
    content = IO.read(target_file)

    #IGNORE_CHARS.each {|c| content.delete!(c)}
    bad_words = 0
    total = 0
    content.each_char do |c|
      next unless HAN_PATTERN.match(c)
      total += 1
      bad_words += 1 unless good_chars.include?(c)
    end
    return total, bad_words

  end
end
