module ApplicationHelper
  require 'redcarpet/render_strip'

  # checking to see if user is admin. Following guide for cancancan and ability integration
  def has_role?(role)
    current_user && current_user.has_role?(role)
  end

  
  # all of this code is from the redcarpet and coderay to help convert between markdown and html rendering
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end


  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_block: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  def strip_markdown(text)
    markdown_to_plain_text = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown_to_plain_text.render(text.html_safe)
  end
end
