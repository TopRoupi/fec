# frozen_string_literal: true

module ApplicationHelper
  include ExercisesHelper
  def markdown(content)
    return "" if content.blank?

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML,
      autolink: true,
      space_after_headers: true,
      tables: true)
    markdown.render(content)
    sanitize(markdown.render(content)).html_safe
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def css(default = "", conditionals = {})
    additions = conditionals.each_with_object([]) { |(k, v), memo| memo << k if v }
    "#{default} #{additions.join " "}"
  end
end
