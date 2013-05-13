# -*- coding: utf-8 -*-
module ArticlesHelper
  def show_stars(bad_word_percentage)
    contennt = ""
    star = image_tag('/assets/star.png')
    star_off = image_tag('/assets/star-off.png')
    if bad_word_percentage < 3
      content = star * 5
    elsif bad_word_percentage < 5
      content = star * 4 + star_off
    elsif bad_word_percentage < 8
      content = star * 3 + star_off * 2
    elsif bad_word_percentage < 10
      content = star * 2 + star_off * 3
    else
      content = star + star_off * 4
    end
  end
  
  def article_result(article)
    content = "<h3><strong>#{article.name}<strong></h3>"
    content += "<p>生字率: #{article.bad_word_percentage}%</p>"
    content += "<p>推荐指数: #{show_stars(article.bad_word_percentage)}</p>"
    content += "<p class=mt10>生字列表:</p>"
    content += "<p>#{article.bad_words.uniq.join("，")}</p>"
    content
  end
end
