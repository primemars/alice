# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), "../lib/grader")

PATTERN_FILE = "../result/pattern/pattern_article/2000"
EXT_PATTERN = ".txt"

def help
  puts "Provide the file path or directory path"
end

if ARGV.length != 1
  help
  exit 1
end

target_files = []
if File.directory?(ARGV[0])
  dir = Dir.new(ARGV[0])
  dir.each do |fn|
    fp = File.join(dir.path, fn)
    target_files << fp if File.file?(fp) and File.extname(fp) == ".txt"
  end
else
  target_files = [ARGV[0]]
end

puts "With #{File.basename(PATTERN_FILE)} words:"
target_files.each do |target_file|
  article_name = File.basename(target_file)
  article_name.slice!(EXT_PATTERN) if article_name.end_with?(EXT_PATTERN)
  total, bad_words =  Grader.grade(PATTERN_FILE, target_file)
  good_word_percentage = ((Float(total-bad_words)/total)*100).round(3)
  puts "#{article_name}: #{good_word_percentage}%"
end
