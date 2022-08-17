module ApplicationHelper
  def text_long?(text)
    return true if text.size > 150

    false
  end

  def trimm_text(text)
    "#{text[0, 150]}..."
  end
end
