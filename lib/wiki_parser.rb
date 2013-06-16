# -*- encoding: utf-8 -*-

class WikiParser
  def to_list(text)
    if text =~ /^\s+\*.(.+)/
      return "<ul><li>#{$1}</li></ul>"
    end
    text
  end

  def to_header(text)
    if text =~ /^(={7,})\s*(.+)\s*\1$/
      return $2.strip
    end
    if text =~ /^(={1,6})\s*(.+)\s*\1$/
      return "<h#{$1.length}>#{$2.strip}</h#{$1.length}>"
    end

    text
  end

  def to_italic(text)
    if text =~ /^(_)(.+)\1$/
      return "<i>#{$2}</i>"
    end

    text
  end

  def to_bold(text)
    if text =~ /^(\*)(.+)\1$/
      return "<b>#{$2}</b>"
    end

    text
  end

end
