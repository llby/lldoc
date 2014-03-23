module VertHelper

  def markdown(text)
    #Redcarpet.new(text).to_html.html_safe
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    Redcarpet::Markdown.new(renderer, tables: true).render(text).html_safe
  end

end
