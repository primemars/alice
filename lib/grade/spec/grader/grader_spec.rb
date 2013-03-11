# -*- coding: utf-8 -*-
require 'spec_helper'

describe Grader do

  describe "#count_frequency" do
    it "returns the total words and all the words frequency in this
    file" do
      total, freq = Grader.count_frequency('./spec/data/dajiangdahai1949.txt')
      puts "字数为#{total}, 字频为："
      freq.each do |k, v|
        puts "#{k}: #{v} #{((Float(v)/total)*10000).round(3)}"
      end
    end
  end

  describe "#grade" do
    it "returns the total words count and the count of the word in the
    target file while not in pattern file" do
      total, bad_words = Grader.grade('./spec/data/pattern_file.txt',
      './spec/data/target_file.txt')

      puts "总计字数为：#{total}字"
      rate = (Float(bad_words)/total)*100
      puts "生字数为：#{bad_words}字。占 #{rate.round(2)}%"
    end
  end

end
