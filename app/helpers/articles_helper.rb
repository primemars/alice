# -*- coding: utf-8 -*-
module ArticlesHelper
  def article_result(article)
    content = "<p>#{article.filename}: #{article.good_word_percentage}%</p>"
    content += "<p class=mt10>生字集合:</p>"
    content += "<p>#{article.bad_words.uniq.join("，")}</p>"
    content
  end
end
