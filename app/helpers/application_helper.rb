module ApplicationHelper
  def markdown(content)
    return '' if content.blank?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML,
                                       autolink: true,
                                       space_after_headers: true,
                                       tables: true)
    markdown.render(content)
    sanitize(markdown.render(content)).html_safe
  end
end
