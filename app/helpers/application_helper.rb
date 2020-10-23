module ApplicationHelper
  def short_text(body)
    short_text = ""
    text_words = body.split(' ')
    5.times {|i| short_text = short_text + text_words[i]+" " unless text_words[i].nil?}
    return short_text
  end
  
  def category_image(category)
    category.articles.last.article_image
  end
end
