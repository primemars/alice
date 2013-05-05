module StaticHelper
  def pattern_words_view(words)
    num_of_line = 45
    content = ""
    words.map{|w| "<span class='mr10'>#{w}</span>"}.each_with_index do |w, i|
      content += w
      content += "<br/>" if (i%num_of_line == num_of_line - 1)
    end
    content
  end
end
