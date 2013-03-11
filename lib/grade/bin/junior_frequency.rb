# -*- coding: utf-8 -*-

require '../lib/grader'

def output_result(total, freq)
  puts "字数为#{total}, 字频为："
  freq.each do |k, v|
    puts "#{k}: #{v} #{((Float(v)/total)*100).round(3)}%"
  end
end

grade1 = ['../data/textbook_article/grade1.txt']
grade2 = grade1 + ['../data/textbook_article/grade2.txt']
grade3 = grade2 + ['../data/textbook_article/grade3.txt']
grade4 = grade3 + ['../data/textbook_article/grade4.txt']
grade5 = grade4 + ['../data/textbook_article/grade5.txt']
grade6 = grade5 + ['../data/textbook_article/grade6.txt']

grade_books = 
  {
  "Grade 1" => grade1,
  "Grade 2" => grade2,
  "Grade 3" => grade3,
  "Grade 4" => grade4,
  "Grade 5" => grade5,
  "Grade 6" => grade6
}

def output_freq(books)
  puts "=============================="
  total, freq = Grader.count_frequency(*books)
  output_result(total, freq)
  puts "=============================="
end

def output_all_grades_freq
  all_books = []
  grade_books.each do |grade, books|
    unless books.empty?
      all_books += books
      puts grade
      output_freq(all_books)
      puts
    end
  end
end

if ARGV.length.zero?
  output_all_grades_freq
elsif ARGV.length == 1
  output_freq(eval("grade"+ARGV[0]))
end





